class Newsletter < ActiveRecord::Base
	attr_accessible :content, :delivered_at, :title

	# # SEO search friendly URLS with FriendlyId
	extend FriendlyId
	friendly_id :title, use: :history

	def self.deliver(id)
		newsletter = find(id)
		newsletter.update_attributes(:delivered_at, Time.now)
	end
end
