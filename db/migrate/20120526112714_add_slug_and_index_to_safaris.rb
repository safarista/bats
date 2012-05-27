class AddSlugAndIndexToSafaris < ActiveRecord::Migration
  def change
    add_column :safaris, :slug, :string
    add_index :safaris, :slug
    
    add_column :treks, :slug, :string
    add_index :treks, :slug
    
    add_column :beaches, :slug, :string
    add_index :beaches, :slug
    
    add_column :day_trips, :slug, :string
    add_index :day_trips, :slug
    
    add_column :albums, :slug, :string
    add_index :albums, :slug
  end
end