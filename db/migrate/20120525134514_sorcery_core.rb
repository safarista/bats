class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :full_name,        :null    => false
      t.string :slug
      t.string :username,         :null    => false  # if you use another field as a username, for example email, you can safely remove this field.
      t.string :email,            :default => nil # if you use this field as a username, you might want to make it :null => false.
      t.boolean :admin,           :null    => false, default: false
      t.boolean :moderator,        :null   => false, default: false
      t.text :about
      t.string :ip_address_info
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
