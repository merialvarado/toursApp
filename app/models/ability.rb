class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    if user.admin?
      can :manage, :all
    elsif user.seller?
      can :read, [Province, Program, Region]
      can :create, [Program]
      can :update, Program do |program|
        program.try(:user) == user
      end
      can :update, Enterprise do |enterprise|
        enterprise.try(:user) == user
      end
      can :destroy, Program do |program|
        program.try(:user) == user
      end
    elsif user.regular?
      can :read, [Program, Province, Region, Enterprise]
    else
      can :read, [Program, Province, Region, Enterprise]
    end
  end
end
