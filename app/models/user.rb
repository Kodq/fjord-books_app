# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy

  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :reverse_of_follows, source: :follower

  # フォローしたときの処理
  def follow(user_id)
    follows.create(followed_id: user_id)
  end

  # フォローを外すときの処理
  def unfollow(user_id)
    follows.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
end
