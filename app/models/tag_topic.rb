class TagTopic < ActiveRecord::Base
  validates :tag, presence: true
  validate :valid_tag

  def valid_tag
    unless ["news", "sports", "music", "search"].include?(self.tag)
      self.errors[:bad_tag] << "tags can only be :news, sports, music, search"
    end
  end

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :urls,
    through: :taggings,
    source: :short_url


end
