class RetraitNonNull < ActiveRecord::Migration[6.0]
  def change
    change_column(:references, :titre, :string, limit: 200, null: true)

    #Titre original (japonais)
    change_column(:references, :orgTitre, :string, null: true)

    #Titre modifié pour apparaitre dans l'URL.
    change_column(:references, :url, :string, null: true)


    #Synopsis
    change_column(:references, :synopsis, :text, limit: 3000, null: true)
    change_column(:references, :isManga, :boolean, null: true)

    #Permet de vérifier si le manga parait dans une édition francophone. (0 => Oui, 1 => Non)
    change_column(:references, :isFr, :boolean, null: true)
    change_column(:references, :isAnime, :boolean, null: true)

    #Vérifie si l'animé est licencié en France
    change_column(:references, :isLicenced, :boolean, null: true)
  end
end
