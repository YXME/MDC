class PagesController < ApplicationController
  def accueil
    @NewRef = Reference.last(8)
    @SponsoRef = Reference.select {|ref| ref.isSponso == true }
    if @SponsoRef.count > 8 then
        @SponsoRef = @SponsoRef.drop(@SponsoRef.count - 8)
    end
  end

  def search
    @Result = Reference.all
  end

  def login
  end

  def register
  end

  def save
      @current_user = Utilisateur.create(email: params[:email], username: params[:username], password: params[:password])
      flash[:info] = "Bienvenue parmi nous #{@current_user.username} !"
      redirect_to "/login"
  end

  def check
      @current_user = Utilisateur.where(username: params[:username], password: params[:password]).first
      if @current_user
        flash[:info] = "Bienvenue #{@current_user.username} !"
        redirect_to "/references/index"
      else
        flash[:info] = "Échec de la connexion"
        redirect_to "/login"
      end
  end
end
