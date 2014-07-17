class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :rewards
  accepts_nested_attributes_for :rewards

  mount_uploader :image, ImageUploader
  acts_as_taggable
end
