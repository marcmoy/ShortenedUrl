class Visit < ActiveRecord::Base
  validates :user_id, :shortened_url_id, presence: true

  belongs_to :visit_users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


  belongs_to :visit_urls,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

end
