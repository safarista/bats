class CreateTreks < ActiveRecord::Migration
  def change
    create_table :treks do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end