# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower, inverse_of: 'follower', class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, inverse_of: 'followed', class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :followings, inverse_of: 'follower', through: :follower, source: :followed
  has_many :followers, inverse_of: 'followed', through: :followed, source: :follower

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
