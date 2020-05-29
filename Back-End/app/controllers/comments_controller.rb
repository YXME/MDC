class CommentsController < ApplicationController
  def index
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if @currentUser.try(:role) != "admin"
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
    @allComments = Commentaire.all
    @allUsers = Utilisateur.all
    @allReference = Reference.all
    render :layout => "application"
  end

  def new
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if !@currentUser then
      flash[:error] = "Veuillez vous connecter !"
      return redirect_to request.referrer || root_path
    end
    @allReference = Reference.all
  end

  def create
    @Com = Commentaire.create(utilisateur_id: params[:utilisateur_id], reference_id: params[:reference_id],note: params[:note],comment: params[:comment])
    redirect_to "/#{Reference.find(params[:reference_id]).url}"
  end

  def destroy_commentaire
    Commentaire.find(params[:id]).destroy
    redirect_to "/comments/index"
  end
end
