class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :dollar_amount, numericality: { greater_than: 0 }

  validate :validuser

  def validuser

    if project.owner == user
      errors.add(:user, 'You cannot back your own project!')

    end

  end
end
