class AddImagesData < ActiveRecord::Migration[6.0]
  def change
    remove_column(:references, :imageUrl)
    remove_column(:utilisateurs, :pdpUrl)
    add_column(:references, :cover_data, :text)
    add_column(:utilisateurs, :profile_data, :text)
  end
end
