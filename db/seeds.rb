# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(email: "user1@email.com")
user2 = User.create!(email: "user2@email.com")
user3 = User.create!(email: "user3@email.com")
user4 = User.create!(email: "user4@email.com")
user5 = User.create!(email: "user5@email.com")

google = ShortenedUrl.create_for_user_and_long_url!(user1, "www.google.com")
facebook = ShortenedUrl.create_for_user_and_long_url!(user2, "www.facebook.com")
espn = ShortenedUrl.create_for_user_and_long_url!(user3, "www.espn.com")
cnn = ShortenedUrl.create_for_user_and_long_url!(user4, "www.cnn.com")
mtv = ShortenedUrl.create_for_user_and_long_url!(user5, "www.mtv.com")

TagTopic.create!(tag: "news")
TagTopic.create!(tag: "sports")
TagTopic.create!(tag: "music")
TagTopic.create!(tag: "search")

Tagging.create!(tag_id: 1, url_id: 4)
Tagging.create!(tag_id: 2, url_id: 3)
Tagging.create!(tag_id: 3, url_id: 5)
Tagging.create!(tag_id: 4, url_id: 1)
Tagging.create!(tag_id: 4, url_id: 2)

ShortenedUrl.create_for_user_and_long_url!(user1, "dfjl;sald;kjjcewlj")
