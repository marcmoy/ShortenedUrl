require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :long_url, presence: true
  validates :url_length

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
  -> { distinct },
  through: :visits,
  source: :visit_users

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :tags,
    through: :taggings,
    source: :tag_topics

  def url_length
    unless self.long_url.length <= 1024
      self.errors[:url_length] << "cannot be over 1024 characters long"
    end
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    code = self.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: code)
  end

  def self.find_long_url(short_url)
    ShortenedUrl.where("short_url = ?", short_url).select(:long_url).first
  end

  def num_clicks
    visits.count
  end

  def num_unique_clicks
    # visits.select(:user_id).distinct.count
    visitors.count
  end

  def num_recent_uniques
    visits.where("created_at < ?", 10.minutes.ago).select(:user_id).distinct.count
  end

  def create!(options)

  end

end
