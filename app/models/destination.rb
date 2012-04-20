class Destination < ActiveRecord::Base
  attr_accessible :description, :destineable_id, :destineable_type, :title, :price
  belongs_to :destineable, polymorphic:  true
end
