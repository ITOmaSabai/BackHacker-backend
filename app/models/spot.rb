class Spot < ApplicationRecord
  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  belongs_to :user

  has_one :address, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
