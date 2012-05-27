class Beach < ActiveRecord::Base
  # MassAssignment protection
  attr_accessible :description, :title
  
  # Validations
  has_many :destinations, as: :destineable, dependent: :delete_all
  
  # Form and Resource Nesting
  accepts_nested_attributes_for :destinations, allow_destroy: true, reject_if: :all_blank
  
  # # SEO search friendly URLS with FriendlyId
  extend FriendlyId
  friendly_id :title, use: :history
  
end
