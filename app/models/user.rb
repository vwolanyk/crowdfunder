class User < ActiveRecord::Base
  authenticates_with_sorcery!
    mount_uploader :image, ProjectImageUploader


  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'

  has_many :pledged_projects, class_name: 'Pledge', foreign_key: 'user_id'


  has_many :comments


  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true





end
