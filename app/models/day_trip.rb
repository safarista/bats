class DayTrip < ActiveRecord::Base
  # MassAssignment protection
  attr_accessible :description, :title
  
  # Assoxiations
  has_many :destinations, as: :destineable, dependent: :delete_all
  
  # Nesting resources and forms
  accepts_nested_attributes_for :destinations, allow_destroy: true, reject_if: :all_blank
  
  # # SEO search friendly URLS with FriendlyId
  extend FriendlyId
  friendly_id :title, use: :history
end
