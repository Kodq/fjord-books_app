# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, inverse_of: 'follower', class_name: 'User'
  belongs_to :followed, inverse_of: 'followed', class_name: 'User'
end
