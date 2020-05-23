class Sponsoredcontent < ActiveRecord::Migration[6.0]
  def change
    #Ajout d'une colonne pour préciser si une série est sponsorisé.
    add_column(:references, :isSponso, :boolean, null: false, default: false)
  end
end
