class UsersController < ApplicationController
  def index
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if @currentUser.try(:role) != "admin"
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
    @allUsers = Utilisateur.all
    render :layout => "application"
  end


  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  def suppression
      Utilisateur.find(session[:user_id]).destroy
      session[:user_id] = nil
      redirect_to "/"
  end



  def profile
    if params[:username] then
      @currentUser = Utilisateur.find_by(username: params[:username])
    else
      @currentUser = Utilisateur.find(session[:user_id])
    end
    if @currentUser.id == session[:user_id] then
      @ownProfile = true
    else
      @ownProfile = nil
    end
    @allListes = Liste.select {| id | id == @currentUser.id }
  end
end
