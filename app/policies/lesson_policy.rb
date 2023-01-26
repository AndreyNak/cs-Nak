# frozen_string_literal: true

class LessonPolicy < ApplicationPolicy
  def index?
    login? && user.user_role.admin?
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    index?
  end

  def update?
    index?
  end

  def edit?
    index?
  end
end
