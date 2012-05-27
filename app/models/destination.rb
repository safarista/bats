class Destination < ActiveRecord::Base
  
  # MassAssignment protection
  attr_accessible :description, :destineable_id, :destineable_type, :title, :price
  
  # Associations
  belongs_to :destineable, polymorphic:  true
  
  # # SEO search friendly URLS with FriendlyId
  # extend FriendlyId
  # friendly_id :title, use: :history
  
end
