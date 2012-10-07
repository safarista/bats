class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
