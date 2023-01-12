# frozen_string_literal: true

class CreateServers < ActiveRecord::Migration[7.0]
  def change
    create_table :servers do |t|
      t.string :name, null: false
      t.string :ip, null: false, limit: 20
      t.integer :count_users, null: false
      t.integer :win_round_t, null: false, default: 0
      t.integer :win_round_ct, null: false, default: 0
      t.timestamps
    end
  end
end
