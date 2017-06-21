class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true

  validate :validuser

  def validuser

    if project.owner == user_id
      return false

  end
end
