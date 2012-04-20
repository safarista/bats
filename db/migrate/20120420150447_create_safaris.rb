class CreateSafaris < ActiveRecord::Migration
  def change
    create_table :safaris do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
