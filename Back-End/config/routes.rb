Rails.application.routes.draw do

  get 'licences/index'
#===================================================== Front Office =====================================================#
    #ajouter une référence
    post 'ajouter' => "references#create"
    get 'ajouter' => "references#ajouter"

#==============================================VIEW PAGES ==============================================#
  #Page d'accueil
  root 'pages#accueil'

  #Page de recherche
  get 'search' => 'pages#search'
  post 'search' => 'pages#search'

  get 'contacter' => 'pages#mailing'

  #Page de connexion
  get 'login' => 'pages#login'
  post 'login' => 'pages#check'

  #page de création de compte
  get 'register' => 'pages#register'
  post 'register' => 'pages#save'

  get 'random' => 'references#random'


#==============================================VIEW REFERENCES ==============================================#

#===================================================== Middle Office =====================================================#
#USERS
  #Page de profil
  get 'users/index'
  get 'users/:username/destroy' => 'users#destroy'


#===================================================== Back Office =====================================================#


  #index de toutes les références
  get 'references/index'

  #index de tout les licences
  delete  'licences/:id' => 'licences#destroy_licence'
  get 'licences/index'
  get 'licences/new'
  post 'licences' => 'licences#add_licence'

  #page de modification de reference
  get ':url/modify' => 'references#modify'
  patch ':url/apply' => 'references#apply_modification'

  #index de tout les studios
  delete  'studios/:id' => 'studios#destroy_studio'
  get 'studios/index'
  get 'studios/new'
  post 'studios' => 'studios#add_studio'

  #index de tout les editeurs
  delete  'editeurs/:id' => 'editeurs#destroy_editeur'
  get 'editeurs/index'
  get 'editeurs/new'
  post 'editeurs' => 'editeurs#add_editeur'

  #index de tout les propriétaires de licences
  delete  'licencers/:id' => 'licencers#destroy_licencer'
  get 'licencers/index'
  get 'licencers/new'
  post 'licencers' => 'licencers#add_licencer'

   #index de tout les commentaires
   get 'comments/index'
   get 'comments/new' => 'comments#new'
   post 'comments/new' => 'comments#create'

   delete  'affiliation/:id' => 'affiliation#destroy_affiliation'
   get 'affiliation/index'
   get 'affiliation/new' => 'affiliation#new'
   post 'affiliation/new' => 'affiliation#create'

   #Page de référence quelconque
   get ':url' => 'references#show'
   get 'users/:username' => 'users#profile'
   get 'users/:username/suppression' => 'users#suppression'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
