class ProductPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    true  # Typically, product listings are public
  end

  def show?
    product.published? || user.admin?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (product.user_id == user.id || user.admin?)
  end

  def destroy?
    user.present? && (product.user_id == user.id || user.admin?)
  end
end
