class WelcomeController < ApplicationController
  skip_before_filter :require_login
  skip_load_and_authorize_resource

  def about_us
    @title = 'About Bless Africa Safaris and Tours'
    
  end

  def accommodation
    @title = 'Accommodation providers in Moshi, Arusha, Kilimanjaro and beach resorts'
    
  end
  
  def contact_us
    @title = 'Contact Us'
  end


  def itineraries
    @trip_types = [Beach, Safari, Trek, DayTrip]
    @title = 'Safari, Trekking, Beach and Short day trip itineraries'
    
  end
  
  def important_information
    @title = 'Important information for your safari and comfort'
  end
  
  def about_tanzania
    @title = 'About Tanzania, Mt Kilimanjaro and Trekking, Safaris, Beaches and short day trips'
  end
  
  def kit_hire
    @title = "Trekking and camping Kit hire and providers"
  end
end
