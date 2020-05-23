Rails.application.routes.draw do

#===================================================== Front Office =====================================================#


#==============================================VIEW PAGES ==============================================#
  #Page d'accueil
  root 'pages#accueil'

  #Page de recherche
  get 'search' => 'pages#search'

  #Page de connexion
  get 'login' => 'pages#login'
  post 'login' => 'pages#check'

  #page de création de compte
  get 'register' => 'pages#register'
  post 'register' => 'pages#save'


#==============================================VIEW REFERENCES ==============================================#
  #Page de référence quelconque
  get ':url' => 'references#show'

#===================================================== Middle Office =====================================================#
#USERS
  #Page de profil
  get ':username' => 'users#profile'

  #Page de commentaire d'une référence (POPUP)

  #Page de rédaction d'un commentaire (POPUP)

  #Page de contact (POPUP)

  #Page d'ajout de référence (POPUP)




#===================================================== Back Office =====================================================#

  #index de toutes les références
  get 'references/index'

  #page de modification de reference
  get ':url/modify' => 'references#modify'

  #index de tout les utilisateurs
  get 'users/index'

   #index de tout les commentaires
   get 'comments/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
