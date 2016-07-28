class ChangeUrLtype < ActiveRecord::Migration
  def change
    change_column :shortened_urls, :long_url, :string, :limit => 1024
  end
end
