class Reward < ActiveRecord::Base
  belongs_to :project

  validates :description, presence: true

  validates :dollar_amount, numericality: { greater_than: 0 }
end
