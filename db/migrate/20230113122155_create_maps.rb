# frozen_string_literal: true

class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :name, null: false
      t.text :image, null: false
      t.timestamps
    end

    add_reference :servers, :map, foreign_key: true
  end
end
