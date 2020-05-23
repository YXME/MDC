class UserMigration < ActiveRecord::Migration[6.0]
  def change

#Table Utilisateurs
    create_table :utilisateurs

    #Adresse mail
    add_column(:utilisateurs, :email, :string, null: false)

    #Nom d'utilisateur
    add_column(:utilisateurs, :username, :string, null: false)

    #Mot de passe
    add_column(:utilisateurs, :password, :string, null: false)

    #Photo de Profil
    add_column(:utilisateurs, :pdpUrl, :string, null: false)

    #Nombre de commentaires
    add_column(:utilisateurs, :NbCom, :integer, null: false)

    #Listes (Les listes utilisateurs sont stockés en JSON)
    add_column(:utilisateurs, :listes_id, :integer, array: true)

#Table Commentaires
    create_table :commentaires

    #ID de l'auteur (Clé étrangère 1)
    add_column(:commentaires, :utilisateur_id, :integer, null: false)

    #ID de la référence (Clé étrangère 2)
    add_column(:commentaires, :reference_id, :integer, null: false)

    #Note attribué
    add_column(:commentaires, :note, :integer, null: false)

    #Texte du commentaire
    add_column(:commentaires, :comment, :text, null: false)


#Table Listes
    create_table :listes

    #Nom de la liste
    add_column(:listes, :name, :string)

    #Contenu de la liste (ID de références)
    add_column(:listes, :contents_id, :integer, array: true)


#Correction du type de champ Note dans la migration Références
  change_column(:references, :note, :decimal, precision: 1)

#Ajout d'un champ pour stocker une liste d'ID de commentaires.
    add_column(:references, :comments_id, :integer, array: true)

  end
end
