class PagesController < ApplicationController
  # load_and_authorize_resource # for cancan 2.0.x
  # skip_authorization_check # CanCan 1.6.x
  skip_before_filter :require_login
  respond_to :html

  # def about_us
  #   # authorize! :static_page, :about_us 
  #   @jo = User.try(:find, 2)
  #   @gb = User.try(:find, 3)
  #   @title = 'About us'
    
  # end

  # def accommodation
  #   # authorize! :static_page, :accommodation
  #   @title = 'Accommodation providers in Moshi, Arusha, Kilimanjaro and beach resorts'
    
  # end
  
  # def contact_us
  #   # authorize! :static_page, :contact_us
  #   @title = 'Contact Us'
  # end

  # def faq
  #   @title = 'Faq'
  # end

  # def itineraries
  #   # authorize! :static_page, :itineraries
  #   @trip_types = [Beach, Safari, Trek, DayTrip]
  #   @title = 'Safari, Trekking, Beach and Short day trip itineraries'
    
  # end
  
  # def important_information
  #   # authorize! :static_page, :important_information
  #   @title = 'Important information for your safari and comfort'
  # end
  
  # def about_tanzania
  #   # authorize! :static_page, :about_tanzania
  #   @title = 'About Tanzania, Mt Kilimanjaro and Trekking, Safaris, Beaches and short day trips'
  # end
  
  # def kit_hire
  #   # authorize! :static_page, :kit_hire
  #   @title = "Trekking and camping Kit hire and providers"
  # end
  
  # def terms_and_conditions
  #   @title = 'Privacy and Terms of service'
  # end

  # def booking
  #   @title = 'Booking'
  # end
  def index
    @title = "All pages"
    @pages = Page.all
  end

  def show
    @page = Page.find_by_slug params[:id]
    @title = @page.name if @page
  end

  def new
    @title = 'Create a new static page'
    @page = Page.new
  end

  def edit
    @page = Page.find_by_slug! params[:id]
    @title = "Edit #{@page.name} page" if @page
  end

  def create
    @page = Page.new(params[:page])
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was created' }
      else
        format.html { render action: :new }
      end
    end
  end

  def update
    @page = Page.find_by_slug! params[:id]
    # @page.name = params[:name]
    # @page.content = params[:content]
    if @page.update_attributes(params[:page])
      redirect_to @page, notice: 'Page was edited'
    else
      render :edit, error: 'There are some errors, check your page again'
    end
  end

  def destroy
    @page = Page.new params[:id]
    @page.destroy
    redirect_to :root, notice: 'Page was deleted'
  end
end
