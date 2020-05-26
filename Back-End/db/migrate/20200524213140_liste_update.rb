class ListeUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column(:listes, :utilisateur_id, :integer, null: false)

    remove_column(:utilisateurs, :listes_id)
  end
end
