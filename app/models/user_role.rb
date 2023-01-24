# frozen_string_literal: true

class UserRole < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  enum name: { admin: 'admin', user: 'user' }
end
