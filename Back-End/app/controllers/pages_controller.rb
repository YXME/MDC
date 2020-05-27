class PagesController < ApplicationController
  def accueil
    @allRef = Reference.all
    @NewRef =  @allRef.select {|ref| ref.isValidated }.last(8)
    @SponsoRef = @allRef.select  {|ref| ref.isSponso == true }
    if @SponsoRef.count > 8 then
        @SponsoRef = @SponsoRef.drop(@SponsoRef.count - 8)
    end
  end

  def search
    if params[:search] then
      @Result = Reference.select {|ref| ref.titre.to_s.downcase.include? params[:search].downcase }.first(8)
    end
  end

  def mailing
    if session[:user_id] then
      @currentUser = Utilisateur.find(session[:user_id])
    end
  end

  def login
    if session[:user_id]
      @curUser = Utilisateur.find(session[:user_id])
      redirect_to "/users/#{@curUser.username}"
    end
  end

  def register
  end

  def save
      @current_user = Utilisateur.create(email: params[:email], username: params[:username], password: params[:password], NbCom: 0)
      redirect_to "/"
  end

  def check
      @current_user = Utilisateur.where(username: params[:username], password: params[:password]).first
      if @current_user
        session[:user_id] = @current_user.id
        redirect_to ("/users/#{@current_user.username}")
      else
        flash[:info] = "Échec de la connexion"
        redirect_to "/login"
      end
  end
end
