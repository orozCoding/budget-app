class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :manage, :all, author_id: user.id

    return unless user.is?('admin') # additional permissions for administrators

    can :manage, :all
  end
end
