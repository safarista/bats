class CreateComments < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    
    create_table :comments do |t|
      t.references :post
      t.string :commenter
      t.string :comment_email
      t.string :comment_url
      t.string :ip_address_info
      t.text :content
      

      t.timestamps
    end
    add_index :comments, :post_id
  end
end