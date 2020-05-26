class ImageNotNul < ActiveRecord::Migration[6.0]
  def change
    change_column(:references, :imageUrl, :string, null: true)
    change_column(:utilisateurs, :pdpUrl, :string, null: true)
  end
end
