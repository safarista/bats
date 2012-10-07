class HomeController < ApplicationController
	# skip_authorization_check
	# skip_load_resource
	# skip_load_and_authorize_resource 

	skip_before_filter :require_login
	def index
		@title = 'Bless Africa Tours and Safaris Tanzania'
		@album = Album.try(:find, :first)
	end
end
