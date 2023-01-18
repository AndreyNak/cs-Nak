class AddPrimeColumnInServer < ActiveRecord::Migration[7.0]
  def change
    add_column :servers, :prime, :boolean, null: false, default: false
  end
end
