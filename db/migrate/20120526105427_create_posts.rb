class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.string :ip_address_info
      t.datetime :published
      t.boolean :ban_comments
      t.text :content

      t.timestamps
    end
  end
end
