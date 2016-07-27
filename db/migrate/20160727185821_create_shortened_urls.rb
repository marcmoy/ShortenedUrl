class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :short_url
      t.string :long_url
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :shortened_urls, :user_id
    add_index :shortened_urls, :short_url
  end
end
