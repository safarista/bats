class Safari < ActiveRecord::Base
  attr_accessible :description, :price, :title
  has_many :destinations, as: :destineable, dependent: :delete_all
  accepts_nested_attributes_for :destinations, allow_destroy: true, reject_if: :all_blank
  
end
