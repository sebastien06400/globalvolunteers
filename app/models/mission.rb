class Mission < ApplicationRecord
  belongs_to :user
  has_many :participations
  has_many :users, through: :participations

  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  # validates :done, default: false

end