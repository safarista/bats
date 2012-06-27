class Comment < ActiveRecord::Base
  
  # Associations
  belongs_to :post
  
  # MassAssignment protection
  attr_accessible :comment_email, :commenter, :content, :ip_address_info, :comment_url
  
  # Validations
  validates :comment_email, :commenter, :content, :comment_url, presence: true
end
