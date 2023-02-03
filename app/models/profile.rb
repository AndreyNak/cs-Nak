# frozen_string_literal: true

class Profile < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_one_attached :avatar

  validates_with AvatarValidator

  scope :all_without, ->(profile) { where.not(id: profile.id) }

  def remove_friend(friend)
    Friendship.destroy_inverse(self, friend)
  end

  def online?
    user.updated_at > 2.minutes.ago
  end
end
