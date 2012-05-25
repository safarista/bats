class User < ActiveRecord::Base
  
  # ========SCHEMA layout========
  # t.string :full_name,        :null    => false
  #   t.string :slag
  #   t.string :username,         :null    => false
  #   t.string :email,            :default => nil 
  #   t.boolean :admin,           :null    => false, default: false
  #   t.boolean :moderator,        :null   => false, default: false
  #   t.text :about
  #   t.string :ip_address_info
  #   t.string :crypted_password, :default => nil
  #   t.string :salt,             :default => nil
  
  # Athentication
  authenticates_with_sorcery!
  
  # MassAssignment protection
  attr_accessible :full_name, :username, :email, :admin, :moderator, :ip_address_info, :password, :password_confirmation, :about, :slag
  
  # Validations
  validates :full_name, :username, presence: true
  validates :username, length: { in: 8..15 }
  validates :email, presence: true,
                    uniqueness: true, 
                    format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, 
                              message: 'Email format is not acceptable.' }

  validates :password, length: { in: 8..15 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  
end
