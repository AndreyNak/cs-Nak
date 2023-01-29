# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :profile
  belongs_to :friend, class_name: 'Profile'

  validate :not_self

  def self.create_inverse(profile, friend)
    Friendship.create(
      [
        { profile:, friend: },
        { profile: friend, friend: profile }
      ]
    )
  end

  def self.destroy_inverse(profile, friend)
    Friendship.where(
      profile:, friend:
    ).or(
      Friendship.where(
        friend: profile, profile: friend
      )
    ).destroy_all
  end

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if profile == friend
  end
end
