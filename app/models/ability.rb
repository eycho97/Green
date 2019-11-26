class Ability
  include CanCan::Ability

  def initialize(user)
    # set user to new User if not logged in
    user ||= User.new # i.e., a guest user
    
    # set authorizations for different user roles
    if user.role? :admin
      # they get to do it all
      can :manage, :all
      
    elsif user.role? :manager

      # # they can update their own profile
      # can :update, User do |u|  
      #   u.id == user.id
      # end
      can [:show, :edit, :create, :update], User, :id => user.id

      #can read information about cusotmers
      can :read, User do |u|
        u.role?(:customer)
      end

      #can crud items
      can [:manage], [Item, Category, Subcat, SubcatItem]
    
    elsif user.role? :customer
      #israel's way
      can [:home, :about, :privacy, :contact], :home
      can [:read, :index, :show], [Item, Category, Subcat, StarredItem, SubcatItem]
      can [:new], [StarredItem]
      can [:show, :edit, :create, :update], User, :id => user.id
    else
      #can read about items
      can [:read, :index, :show], [Item, Category, Subcat, StarredItem, SubcatItem] #not inventory level tho
      #can create an account
      can :create, User
    end
  end
end
