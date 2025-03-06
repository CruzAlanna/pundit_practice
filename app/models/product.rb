class Product < ApplicationRecord
  belongs_to :user

  def published?
    published == true
  end
end
