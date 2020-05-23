class RefMod < ActiveRecord::Migration[6.0]
  def change
      #Ajout d'une colonne pour vérifier si la référence a été validée par un administrateur (donc est visible aux yeux des utilisateurs)
      add_column(:references, :isValidated, :boolean, null: false, default: false)
  end
end
