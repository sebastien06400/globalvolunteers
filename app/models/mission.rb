class Mission < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  has_one_attached :photo
  # validates :done, default: false
end
