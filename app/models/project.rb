class Project < ActiveRecord::Base

  mount_uploader :image, ProjectImageUploader

  has_many :rewards
  has_many :pledges 
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :start_date, :end_date, presence: true

end

# Removed :owner from 'validates' because it was breaking Seeds.rb
