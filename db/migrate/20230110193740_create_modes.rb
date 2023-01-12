# frozen_string_literal: true

class CreateModes < ActiveRecord::Migration[7.0]
  def change
    create_table :modes do |t|
      t.string :name, null: false, limit: 40
      t.text :description
      t.timestamps
    end

    add_reference :servers, :mode, foreign_key: true
  end
end
