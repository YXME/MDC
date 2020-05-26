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

  def destroy_commentaire
    Commentaire.find(params[:id]).destroy
    redirect_to "/comments/index"
  end
end
