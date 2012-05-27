class Photo < ActiveRecord::Base
  # Mounted image uploader
  mount_uploader :name, MediaUploader
  
  # MassAssignment protectio
  attr_accessible :caption, :name
  
  # Validations
  validates :name, presence: true
  
  # Associations
  belongs_to :album
  
  # # # SEO search friendly URLS with FriendlyId
  # extend FriendlyId
  # friendly_id :name, use: :history
  
end
