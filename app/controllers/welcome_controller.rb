class WelcomeController < ApplicationController
  load_and_authorize_resource :class => false
  skip_before_filter :require_login

  def about_us
    # authorize! :static_page, :about_us 
    @jo = User.try(:find, 2)
    @gb = User.try(:find, 3)
    @title = 'About Bless Africa Safaris and Tours'
    
  end

  def accommodation
    # authorize! :static_page, :accommodation
    @title = 'Accommodation providers in Moshi, Arusha, Kilimanjaro and beach resorts'
    
  end
  
  def contact_us
    # authorize! :static_page, :contact_us
    @title = 'Contact Us'
  end


  def itineraries
    # authorize! :static_page, :itineraries
    @trip_types = [Beach, Safari, Trek, DayTrip]
    @title = 'Safari, Trekking, Beach and Short day trip itineraries'
    
  end
  
  def important_information
    # authorize! :static_page, :important_information
    @title = 'Important information for your safari and comfort'
  end
  
  def about_tanzania
    # authorize! :static_page, :about_tanzania
    @title = 'About Tanzania, Mt Kilimanjaro and Trekking, Safaris, Beaches and short day trips'
  end
  
  def kit_hire
    # authorize! :static_page, :kit_hire
    @title = "Trekking and camping Kit hire and providers"
  end
end
