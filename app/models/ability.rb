class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Category
    can :read, Coupon, :hidden => false,
                       :begin_date.lt => Time.now,
                       :end_date.gt => Time.now

    can :read, PointOfContact
    can :read, Merchant, :approved => true
    can :create, User

    if user.persisted?
      can :manage, Merchant, :user_id => user.id
      can :manage, Coupon, :merchant => {:user_id => user.id}
      can :manage, PointOfContact, :merchant => {:user_id => user.id}
      can :manage, User, :id => user.id
    end

  end
end
