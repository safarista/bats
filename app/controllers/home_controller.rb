class HomeController < ApplicationController
  skip_before_filter :require_login
  skip_load_and_authorize_resource :only => :index
  def index
    @title = 'Welcome to Bless Africa Safaris and Tours Tanzania'
    @album = Album.try(:first)
  end
end
