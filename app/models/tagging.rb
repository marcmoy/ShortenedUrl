class Tagging < ActiveRecord::Base

  belongs_to :tag_topics,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :short_url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl

end
