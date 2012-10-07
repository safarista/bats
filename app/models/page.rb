class Page < ActiveRecord::Base
	attr_accessible :content, :name, :slug

	validates :name, presence: true
	## SEO search friendly URLS with FriendlyId
	extend FriendlyId
	friendly_id :name, use: :history
end