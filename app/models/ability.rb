class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Coupon, :hidden => false
    can :read, Coupon, :end_date.gt => Time.now
    can :read, Coupon, :begin_date.lt => Time.now

    can :read, Category

    can :read, PointOfContact

    can :read, Merchant, :approved => true

    if user.persisted?
      can :manage, Merchant, :user_id => user.id
      can :manage, Coupon, :merchant => {:user_id => user.id}
    end

  end
end
