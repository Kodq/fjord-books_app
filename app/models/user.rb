# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar # 追記
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
