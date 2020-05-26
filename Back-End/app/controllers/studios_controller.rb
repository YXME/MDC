class StudiosController < ApplicationController
  def index
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if @currentUser.try(:role) != "admin"
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
    @allStudios = Studio.all
    render :layout => "application"
  end

  def show
    @selStudio = Studio.find(params[:id])
  end

  def add_studio
    Studio.create nom: params[:nom]
    redirect_to "/studios/index"
  end

  def destroy_studio
    Studio.find(params[:id]).destroy
    redirect_to "/studios/index"
  end
end
