class Task < ApplicationRecord
  # Association
  belongs_to :category
  belongs_to :user
  

  # Validation
  validates :task_name, presence: true
  validates :task_body, presence: true
  validates :deadline, presence: true
  validates :status, presence: true
end
