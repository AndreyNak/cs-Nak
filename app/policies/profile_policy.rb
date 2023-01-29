# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  def edit?
    me?
  end

  def friendship?
    !me? && user.profile.pending_friends.exclude?(record)
  end

  def unfriend?
    !me?
  end

  def me?
    user.profile == record
  end
end
