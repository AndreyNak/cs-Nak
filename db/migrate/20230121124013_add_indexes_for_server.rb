class AddIndexesForServer < ActiveRecord::Migration[7.0]
  def change
    add_index :servers, :name
  end
end
