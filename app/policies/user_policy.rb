class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end
  
  attr_reader :user, :target_user

  def initialize(user, target_user)
    @user = user # current user
    @target_user = target_user # user we want to promote
  end

  def promote?
    user.admin?
  end
end
