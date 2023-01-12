# frozen_string_literal: true

class Mode < ApplicationRecord
  extend FriendlyId

  has_many :servers, dependent: :destroy

  friendly_id :name, use: :slugged
end
