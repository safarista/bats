class CreateDayTrips < ActiveRecord::Migration
  def change
    create_table :day_trips do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
