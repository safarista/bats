class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :title
      t.text :price
      t.text :description
      t.integer :destineable_id
      t.string :destineable_type

      t.timestamps
    end
  end
end
