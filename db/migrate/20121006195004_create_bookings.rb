class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :group_size
      t.string :booking_number
      t.datetime :arrival_date 
      t.datetime :departure
      t.text :contact_address
      t.string :contact_phone
      t.string :contact_email
      t.text :additional_info
      
      t.timestamps
    end
  end
end
