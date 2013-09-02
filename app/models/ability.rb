class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:show, :index, :by_user], Question
    can [:show, :index], User

    if user.has_role?(:admin)
      can :manage, :all
    end

    if user.has_role?(:moderator)
      can :manage, Question
      can :manage, Solution
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end

    if user.has_role?(:member)
      can [:edit, :delete], Question, :user_id => user.id
      can [:create, :vote], Question
      can [:my_questions], Question
      can [:edit, :delete], Solution, :user_id => user.id
      can [:create, :vote], Solution
      can [:edit, :update], User, :id => user.id

      can :create, Friendship
      can :destroy, Friendship, :user_id => user.id
    end

  end
end
