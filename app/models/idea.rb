class Idea < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :idea_images
  has_many :images, through: :idea_images
  belongs_to :user
end
