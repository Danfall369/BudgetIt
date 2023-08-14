class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Define abilities based on user roles and permissions
    if user.admin
      can :manage, :all # Admin can perform any action on any model
    else
      # Regular user permissions
      can :read, [Bill, Service] # Regular user can read bills and services
      can :manage, Bill, author_id: user.id # User can manage their own bills
      can :manage, Service, author_id: user.id # User can manage their own services
    end
  end
end
