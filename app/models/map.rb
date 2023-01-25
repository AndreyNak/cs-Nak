class Map < ApplicationRecord
  has_many :servers, dependent: :nullify
  has_many :mods, through: :servers

  has_one_attached :main_image
end
