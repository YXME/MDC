class LaVraieDerniere < ActiveRecord::Migration[6.0]
  def change
      remove_column(:affiliates, :imageUrl)

      add_column(:affiliates, :image_data, :text, null: true)
  end
end
