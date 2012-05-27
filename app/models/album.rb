class Album < ActiveRecord::Base
  # MassAssignment protection
  attr_accessible :description, :title
  
  # Associations
  has_many :photos, dependent: :delete_all
  
  # # SEO search friendly URLS with FriendlyId
  extend FriendlyId
  friendly_id :title, use: :history
  
end
