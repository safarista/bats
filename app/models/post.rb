class Post < ActiveRecord::Base
  # # ====SCHEMA structure ======
  # t.string :title
  # t.string :slag
  # t.string :ip_address_info
  # t.datetime :published
  # t.boolean :ban_comments
  # t.text :content
  
  # # MassAssignment protection
  attr_accessible :ban_comments, :content, :ip_address_info, :published, :slug, :title, :comments_attributes
  
  # # Validations
  validates :title, :content, presence: true
  
  # # Associations 
  has_many :comments, dependent: :delete_all
  belongs_to :user
  
  # # SEO search friendly URLS with FriendlyId
  extend FriendlyId
  friendly_id :title, use: :history
  accepts_nested_attributes_for :comments, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
end
