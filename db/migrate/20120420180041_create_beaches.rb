class CreateBeaches < ActiveRecord::Migration
  def change
    create_table :beaches do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
