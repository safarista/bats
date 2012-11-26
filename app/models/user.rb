class User < ActiveRecord::Base
  
  # #========SCHEMA Structure========
  #   t.string :full_name,        :null    => false
  #   t.string :slag
  #   t.string :username,         :null    => false
  #   t.string :email,            :default => nil 
  #   t.boolean :admin,           :null    => false, default: false
  #   t.boolean :moderator,        :null   => false, default: false
  #   t.text :about
  #   t.string :ip_address_info
  #   t.string :crypted_password, :default => nil
  #   t.string :salt,             :default => nil
  
  # # Athentication
  authenticates_with_sorcery!
  
  # # MassAssignment protection
  attr_accessible :full_name, :username, :email, :admin, :moderator, :ip_address_info, :password, :password_confirmation, :about, :slug
  
  # # Validations
  validates :full_name, :username, presence: true
  validates :username, uniqueness: true, length: { in: 8..15 }
  validates :email, presence: true,
                    uniqueness: { :case_sensitive => false }, 
                    format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, 
                              message: 'Email format is not acceptable.' }

  validates :password, length: { in: 8..15 }, if: :password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, if: :password
  
  # # Associations
  has_many :posts, dependent: :nullify
  
  # # SEO search friendly URLS with FriendlyId
  extend FriendlyId
  friendly_id :full_name, use: :history

  # Filters
  before_save :fix_username

  private

  def fix_username
    username =  self.username.downcase.strip.squeeze.gsub(/\s/, '_') if username_changed?
  end
  
end
