class Category < ApplicationRecord
  # Association
  has_many :tasks
  # belongs_to :user

  # Validation
  validates :category_name, presence: true, uniqueness: true
  validates :category_body, presence: true, uniqueness: true
end
