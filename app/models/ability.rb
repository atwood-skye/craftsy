class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        # can :update, Review do |review|
        #   review.user == user
        # end
        # can :destroy, Review do |review|
        #   review.user == user
        # end
        # can :create, Review
        can :read, :all
      end

  end
end
