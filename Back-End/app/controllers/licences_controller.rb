class LicencesController < ApplicationController
  def index
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if @currentUser.try(:role) != "admin"
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
    @allLicences = Licence.all
    render :layout => "application"
  end

  def show
    @selLicence = Licence.find(params[:id])
  end

  def add_licence
    Licence.create nom: params[:nom]
    redirect_back(fallback_location: fallback_location)
  end

  def destroy_licence
    Licence.find(params[:id]).destroy
    redirect_to "/licences/index"
  end
end
