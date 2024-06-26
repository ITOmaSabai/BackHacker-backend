class User < ApplicationRecord
  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.find_or_create_user(user_info)
    user = User.find_by(uid: user_info[:uid])
    return user if user

    User.create!(uid: user_info[:uid], name: user_info[:name], avatar: user_info[:avatar])
  end
end
