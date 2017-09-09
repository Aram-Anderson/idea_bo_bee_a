class Image < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
