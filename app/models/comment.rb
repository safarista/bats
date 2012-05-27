class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :comment_email, :commenter, :content, :ip_address_info, :comment_url
  
  # Validations
  validates :comment_email, :commenter, :content, presence: true
end
