class AddImageToMods < ActiveRecord::Migration[7.0]
  def change
    add_column :modes, :image, :string
  end
end
