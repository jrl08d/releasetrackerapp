class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all

    elsif user.customers.any?
      can :read, Release do |release|
        release.customers.where(id: user.customer.id).count > 0
      end

      can :read, Deployment do |deployment|
        deployment.customer.user == user
      end
    end
  end
end
