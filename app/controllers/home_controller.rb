class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
    @title = 'Welcome to Bless Africa Safaris and Tours Tanzania'
    @album = Album.try(:find, 2)
  end
end
