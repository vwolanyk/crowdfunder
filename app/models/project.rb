class Project < ActiveRecord::Base


  mount_uploader :image, ProjectImageUploader


  

  has_many :comments

  has_many :rewards
  has_many :pledges, dependent: :destroy
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  has_and_belongs_to_many :categories

  # accepts_nested_attributes_for :categories


  validates :title, :description, :goal, :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_less_than_start_date, :on => :create

  # helper_method :project_past_end_date?


  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_less_than_start_date
    if end_date < start_date
      errors.add(:end_date, "Project end date must be later than start date!")
    end
  end

  def project_past_end_date?
  end_date < Date.today
  end

end

# Removed :owner from 'validates' because it was breaking Seeds.rb
