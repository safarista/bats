class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in (current) user. For example:
    user ||= User.new
      if user.admin?
        can :access, :all
      else
        can :create, :bookings
        can :read, [:home, :albums, :photos, :treks, :beaches, :safaris, :day_trips, :posts, :comments, :pages]
        can :create, [:comments, :users, :sessions]
        can :destroy, :sessions
        can :read, :users 
        can [:update, :destroy], :users, :id => user.id 
        can :read, :destinations
        can :access, :welcome
      end

    # Here if there is a user he will be able to perform any action on any controller.
    # If someone is not logged in he can only access the home, users, and sessions controllers.
    #
    # The first argument to `can` is the action the user can perform. The second argument
    # is the controller name they can perform that action on. You can pass :access and :all
    # to represent any action and controller respectively. Passing an array to either of
    # these will grant permission on each item in the array.
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
