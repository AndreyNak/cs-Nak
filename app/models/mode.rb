# frozen_string_literal: true

class Mode < ApplicationRecord
  extend FriendlyId

  has_many :servers, dependent: :destroy
  has_many :maps, through: :servers

  friendly_id :name, use: :slugged

  def count_users
    servers.sum(:count_users)
  end
end
