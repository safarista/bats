class Safari < ActiveRecord::Base
  
  # MassAssignment protection
  attr_accessible :description, :price, :title
  
  # Associations
  has_many :destinations, as: :destineable, dependent: :delete_all
  
  # NestingForms
  accepts_nested_attributes_for :destinations, allow_destroy: true, reject_if: :all_blank
  
  # # SEO search friendly URLS with FriendlyId
  extend FriendlyId
  friendly_id :title, use: :history
  
end
