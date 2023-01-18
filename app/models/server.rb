# frozen_string_literal: true

class Server < ApplicationRecord
  belongs_to :mode
  belongs_to :map

  FULL_COUNT_SERVER = 30
end
