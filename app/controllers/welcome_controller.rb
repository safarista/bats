class WelcomeController < ApplicationController

  def about_us
    @title = 'About Bless Africa Safaris and Tours'
  end

  def contact_us
    @title = 'Contact Us'
  end
  
  def index
    @title = 'Welcome to Bless Africa Safaris and Tours Tanzania'
  end

  def itineraries
    @trip_types = [Beach, Safari, Trek, DayTrip]
    @title = 'Safari, Trekking, Beach and Short day trip itineraries'
    
  end
  
  def important_information
    @title = 'Important information for your safari and comfort'
  end
end
