class ReferencesController < ApplicationController
  def reference_params
  params.require(:references).permit(:titre, :soustitre, :imageUrl) ## Add :image attribute
  end

  def index
    @currentUser = Utilisateur.find_by(id: session[:user_id])
    if @currentUser.try(:role) != "admin"
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
    @allRef = Reference.all
      render :layout => "application"
  end

  def random
    @randomReference = Reference.find(rand 1..Reference.count)
    redirect_to "/#{@randomReference.url}"
  end

  def ajouter
    @allEditeurs = Editeur.all
    @allStudios = Studio.all
    @allLicencer = Licencer.all
    render :layout => "application"
  end

  def create
      @Ref = Reference.create(patch_params)
      @Ref.titre = params[:titre]
      @Ref.sousTitre = params[:sousTitre]
      @Ref.orgTitre = params[:orgTitle]
      @Ref.synopsis = params[:synopsis]
      @Ref.parStatus = params[:parStatus]
      @Ref.nbVolJp = params[:nbVolJp]
      @Ref.nbVolFr = params[:nbVolFr]
      @Ref.edition_id = params[:editeur]
      @Ref.difStatus = params[:difStatus]
      @Ref.nbEpTotal = params[:nbeptotal]
      @Ref.nbOAVTotal = params[:nbOAVTotal]
      @Ref.nbFilmsTotal = params[:nbfilmstotal]
      @Ref.studio_id = params[:studio]
      @Ref.licencer_id = params[:licencer]
      @Ref.licence_id = params[:licence]


      if params[:isManga] then
        @Ref.isManga = true
      end

      if params[:isLicenced] then
        @Ref.isLicenced = true
      end

      if params[:isFr] then
        @Ref.isFr = true
      end

      if params[:isAnime] then
        @Ref.isAnime = true
      end

      if params[:sousTitre] then
        @Ref.url = params[:sousTitre].tr(" ", "_")
      else
        @Ref.url = params[:titre].tr(" ", "_")
      end

      @Ref.save
      redirect_to("/")
  end

  def modify
      @selRef = Reference.find_by(url: params[:url])
      if @selRef.licence_id and @selRef.licence_id != 0
        @selLicence = Licence.find(@selRef.licence_id)
      end
      @allEditeurs = Editeur.all
      @allStudios = Studio.all
      @allLicencers = Licencer.all
      @allLicences = Licence.all


      if(@selRef.isManga and @selRef.isFr) then
        @selEditeur = Editeur.find(@selRef.edition_id)
      end

      if(@selRef.isAnime)
        @selStudio = Studio.find(@selRef.studio_id)
        if(@selRef.isLicenced)
          @selLicencer = Licencer.find(@selRef.licencer_id)
        end
      end
  end

  def apply_modification
    @Ref = Reference.find_by(titre: params[:titre])
    @Ref.titre = params[:titre]
    @Ref.sousTitre = params[:sousTitre]
    @Ref.orgTitre = params[:orgTitle]
    @Ref.synopsis = params[:synopsis]
    @Ref.parStatus = params[:parStatus]
    @Ref.nbVolJp = params[:nbVolJp]
    @Ref.nbVolFr = params[:nbVolFr]
    @Ref.edition_id = params[:editeur]
    @Ref.difStatus = params[:difStatus]
    @Ref.nbEpTotal = params[:nbeptotal]
    @Ref.nbOAVTotal = params[:nbOAVTotal]
    @Ref.nbFilmsTotal = params[:nbfilmstotal]
    @Ref.studio_id = params[:studio]
    @Ref.licencer_id = params[:licencer]
    @Ref.licence_id = params[:licence]

    if params[:isManga] then
      @Ref.isManga = true
    else
      @Ref.isManga = false
    end

    if params[:cover_data]
      @temp_var = params[:cover_data].to_s
      @Ref.cover_data = @temp_var.tr("\"", "\\\"")
    end

    if params[:isLicenced] then
      @Ref.isLicenced = true
    else
      @Ref.isLicenced = false
    end

    if params[:isFr] then
      @Ref.isFr = true
    else
      @Ref.isFr = false
    end

    if params[:isValidated] then
      @Ref.isValidated = true
    else
      @Ref.isValidated = false
    end

    if params[:isAnime] then
      @Ref.isAnime = true
    else
      @Ref.isAnime = false
    end

    if params[:sousTitre] then
      @Ref.url = params[:sousTitre].tr(" ", "_")
    else
      @Ref.url = params[:titre].tr(" ", "_")
    end

    @Ref.save()
    redirect_to("/")
  end


  def show
    @allRef = Reference.all
    @allComments = Commentaire.all
    @selRef = Reference.find_by(url: params[:url])
    if @selRef.isValidated then

      @allComments.each do |iteComment|
        if iteComment.reference_id == @selLicence.id then
          @Comments.add(iteComment)
        end
      end
      @Note = 0
      if @Comments then
          @Comments.each do |iteComment|
            @Note += iteComment.note / @Comments.count
          end
          @Note = "#{@Note}★/5"
      else
        @Note = "Aucune note attribué"
      end

      if(@selRef.isManga and @selRef.isFr) then
        @selEditeur = Editeur.find(@selRef.edition_id)
      end

      if(@selRef.isAnime)
        @selStudio = Studio.find(@selRef.studio_id)
        if(@selRef.isLicenced)
          @selLicencer = Licencer.find(@selRef.licencer_id)
        end
      end

      @linkRef = Array.new

      if @selRef.licence_id then
        @selLicence = Licence.find(@selRef.licence_id)
        @allRef.each do |iteRef|
          if iteRef.licence_id == @selLicence.id and iteRef.id != @selRef.id then
            @linkRef.push(iteRef)
          end
        end
      end
    else
      redirect_to("/")
    end
  end

  private
    def patch_params
      params.permit(:titre, :sousTitre, :orgTitre, :url, :synopsis, :licence_id, :note, :isManga, :isFr, :parStatus, :nbVolFr, :nbVolJp, :nbEpTotal, :nbOAVTotal, :nbFIlmsTotal, :studio_id, :licencer_id, :isSponso, :isValidated, :cover)
    end
end
