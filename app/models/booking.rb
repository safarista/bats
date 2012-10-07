class Booking < ActiveRecord::Base
  attr_accessible :group_size, :group_size, :booking_number, :arrival_date, :departure, :contact_address, :contact_phone, :contact_email, :additional_info
end
