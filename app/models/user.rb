# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower, inverse_of: 'follow', class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy # フォロー取得
  has_many :followed, inverse_of: 'follow', class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy # フォロワー取得
  has_many :followings, inverse_of: 'follow', through: :follower, source: :followed # 自分がフォローしている人
  has_many :followers, inverse_of: 'follow', through: :followed, source: :follower # 自分をフォローしている人

  # ユーザーをフォローする、後ほどcontrollerで使用します。
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す、後ほどcontrollerで使用します。
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す、後ほどviewで使用します。
  def following?(user)
    followings.include?(user)
  end
end
