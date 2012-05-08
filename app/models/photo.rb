class Photo < ActiveRecord::Base
  mount_uploader :name, MediaUploader
  attr_accessible :caption, :name
  validates :name, presence: true
  belongs_to :album
  
end
