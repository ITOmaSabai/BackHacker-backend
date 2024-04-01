class Spot < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
