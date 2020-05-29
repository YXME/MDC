class LicencersController < ApplicationController
  def index
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if @currentUser.try(:role) != "admin"
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
    @allLicencers = Licencer.all
    render :layout => "application"
  end

  def show
    @selLicencer = Licencer.find(params[:id])
  end

  def add_licencer
    Licencer.create nom: params[:nom]
  end

  def destroy_licencer
    Licencer.find(params[:id]).destroy
    redirect_to "/licencers/index"
  end
end
