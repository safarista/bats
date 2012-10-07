class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
  enable_authorization # for CanCan 2.0
  # check_authorization #for CanCan 1.6.*

  # rescue_from CanCan::AccessDenied do |exception|
  #   # render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  #   ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
  #   ## this render call should be:
  #   render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: true
  # end


  protected
  def not_authenticated
    redirect_to root_path, :alert => "Please login first."
  end

end
