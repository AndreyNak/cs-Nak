# frozen_string_literal: true

class FriendRequest < ApplicationRecord
  belongs_to :profile
  belongs_to :friend, class_name: 'Profile'

  validate :not_self

  validate :not_friends
  validate :not_pending

  def accept_friend
    Friendship.create_inverse(profile, friend)

    destroy
  end

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if profile == friend
  end

  def not_friends
    errors.add(:friend, 'is already added') if profile.friends.include?(friend)
  end

  def not_pending
    errors.add(:friend, 'already requested friendship') if friend.pending_friends.include?(profile)
  end
end
