class ReferencesMigration < ActiveRecord::Migration[6.0]
  def change

#Table Licence
    create_table :licences

  #Nom de la licence
    add_column(:licences, :nom, :string, null: false)

  #Id du propriétaire de la licencer
    add_column(:licences, :licencer_id, :integer)

#==================================================

#Table Licencer
    create_table :licencers

  #Nom du propriétaire de licence
    add_column(:licencers, :nom, :string, null: false)

#==================================================

#Table Editeur
    create_table :editeurs

  #Nom de la maison d'édition
    add_column(:editeurs, :nom, :string, null: false)  

#==================================================

#Table Studio
    create_table :studios

  #Nom du studio
    add_column(:studios, :nom, :string, null: false)

#==================================================


#Table Référence  
    create_table :references

  #Données générales

    #Titre affiché par défault
    add_column(:references, :titre, :string, limit: 200, null: false)

    #Sous Titre (Utilisé pour l'URL ou pour palier à un titre qui casse l'habillage du site)
    add_column(:references, :sousTitre, :string, limit: 50)

    #Titre original (japonais)
    add_column(:references, :orgTitre, :string, null: false)

    #Titre modifié pour apparaitre dans l'URL.
    add_column(:references, :url, :string, null: false)

    #Illustration affiché sur la page
    add_column(:references, :imageUrl, :string, null: false)

    #Synopsis
    add_column(:references, :synopsis, :text, limit: 3000, null: false)

    #Licence (Clé étrangère 1) Regroupe les oeuvres d'une même licence pour la section "Séries liées" du site.
    add_column(:references, :licence_id, :integer)

    #Note moyenne des utilisateurs
    add_column(:references, :note, :integer) #devait être en :decimal (Changé dans la migration Utilisateur)

  #Données relatives au manga
  #S'il n'existe pas de manga pour la référence, les données de l'animé seront utilisés.

    #Permet de vérifier s'il existe un manga. (0 => Oui, 1 => Non)
    add_column(:references, :isManga, :boolean, null: false)

    #Permet de vérifier si le manga parait dans une édition francophone. (0 => Oui, 1 => Non)
    add_column(:references, :isFr, :boolean, null: false)

    #Si les données précédemments listés sont égales à 0, tout les champs suivant seront affichés.
      #Si le manga ne parait pas dans une édition francophone, alors l'éditeur ne devra pas être affiché sur la page. (Le nombre de volumes Japonais devra être renseigné.)

      #Statut de parution (A venir, En cours, Terminée.)
      add_column(:references, :parStatus, :string)

      #Nombre de volumes (Français si existant, Japonais sinon.)
      add_column(:references, :nbVolFr, :integer)
      add_column(:references, :nbVolJp, :integer)

      #Edition (Clé étrangère 2) (Uniquement Française)
      add_column(:references, :edition_id, :integer)

  #Données relatives à l'animé
  #S'il n'existe pas, les champs suivant ne seront pas affiché.
  #Par défaut, si une série possède un manga pour plusieurs saisons, tout les épisodes de chaque saison seront regroupés ici.
  #S'il existe plusieurs séries de manga de la même licence, chaque adaptation suivra le manga duquel il est tiré.
  #Si les séries de manga n'ont pas donné suite à une adaptation en animé alors tout sera référencé à part et lié par la licence.

    #Vérifie s'il existe au moins un animé
    add_column(:references, :isAnime, :boolean, null: false)

    #Vérifie si l'animé est licencié en France
    add_column(:references, :isLicenced, :boolean, null: false)

        #Statut de diffusion (A venir, En cours, Terminée.)
        add_column(:references, :difStatus, :string)

        #Nombre d'épisodes total (Toutes saisons confondues)
        add_column(:references, :nbEpTotal, :integer)

        #Nombre d'OAV total (Toutes saisons confondues)
        add_column(:references, :nbOAVTotal, :integer)

        #Nombre de films total (Toutes saisons confondues)
        add_column(:references, :nbFilmsTotal, :integer)
    
        #Studio (Clé étrangère 3) 
        add_column(:references, :studio_id, :integer)

        #Licencié par (Clé étrangère 4)
        add_column(:references, :licencer_id, :integer)


    # ! La colonne destiné aux commentaires est ajouté dans la migration utilisateur !

  #==================================================

  end
end
