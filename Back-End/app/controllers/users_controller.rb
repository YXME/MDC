class UsersController < ApplicationController
  def index

  end

  def profile
    @CurrentUser = Utilisateur.find(params[:id])
    @CurrentUser.listes_id.each {|id| @allUsersLists.add(Liste.find(id))}
  end
end
