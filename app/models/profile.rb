# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def remove_friend(friend)
    Friendship.destroy_inverse(self, friend)
  end

  scope :all_without, ->(profile) { where.not(id: profile.id) }
end
