class User < ApplicationRecord
  has_many :products
  
  has_secure_password
  validates :email, presence: true, uniqueness: true
  # Only allow 'user' or 'admin' as valid roles
  validates :role, inclusion: { in: %w[user admin], message: "%{value} is not a valid role" }

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end
