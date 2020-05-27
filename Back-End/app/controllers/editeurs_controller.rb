class EditeursController < ApplicationController
  def index
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if @currentUser.try(:role) != "admin"
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
    @allEditeurs = Editeur.all
    render :layout => "application"
  end

  def show
    @selEditeur = Editeur.find(params[:id])
  end

  def add_editeur
    Editeur.create nom: params[:nom]
    redirect_back fallback_location: "/"
  end

  def destroy_editeur
    Editeur.find(params[:id]).destroy
    redirect_to "/editeurs/index"
  end
end
