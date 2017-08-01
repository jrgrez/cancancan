class Ability
  include CanCan::Ability

  def initialize(user)

       user ||= User.new(role: 2) # guest user (not logged in)
       if user.admin?
         can :manage, :all
       elsif user.normal?
         can :read, :all
         can :manage, Post, {user_id: user.id}
         can :manage, Comment, {user_id: user.id}
         can :manage, User, {user_id: user.id}
       else
         can :read, :all
       end
    
  end
end
