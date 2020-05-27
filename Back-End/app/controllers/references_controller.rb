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
    @Ref = Reference.create(patch_params)
    @allEditeurs = Editeur.all
    @allStudios = Studio.all
    @allLicencer = Licencer.all
    render :layout => "application"
  end

  def create
      @Ref = Reference.find(params[:id])
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
    @Ref = Reference.find_by(url: params[:url])

    if params[:reference][:titre] then
        @Ref.titre = params[:reference][:titre]
    end

    if params[:reference][:sousTitre] then
        @Ref.sousTitre = params[:reference][:sousTitre]
    end

    if params[:reference][:orgTitre] then
        @Ref.orgTitre = params[:reference][:orgTitre]
    end

    if params[:reference][:synopsis] then
        @Ref.synopsis = params[:reference][:synopsis]
    end

    if params[:reference][:parStatus] then
        @Ref.parStatus = params[:reference][:parStatus]
    end

    if params[:reference][:nbVolJp] then
        @Ref.nbVolJp = params[:reference][:nbVolJp]
    end

    if params[:reference][:nbVolFr] then
        @Ref.nbVolFr = params[:reference][:nbVolFr]
    end

    if params[:reference][:editeur] then
        @Ref.edition_id = params[:reference][:editeur]
    end

    if params[:reference][:difStatus] then
        @Ref.difStatus = params[:reference][:difStatus]
    end

    if params[:reference][:nbEpTotal] then
        @Ref.nbEpTotal = params[:reference][:nbEpTotal]
    end

    if params[:reference][:nbOAVTotal] then
        @Ref.nbOAVTotal = params[:reference][:nbOAVTotal]
    end

    if params[:reference][:nbFilmsTotal] then
        @Ref.nbFilmsTotal = params[:reference][:nbFilmsTotal]
    end

    if params[:reference][:studio] then
        @Ref.studio_id = params[:reference][:studio]
    end

    if params[:reference][:licencer] then
        @Ref.licencer_id = params[:reference][:licencer]
    end

    if params[:reference][:licence] then
        @Ref.licence_id = params[:reference][:licence]
    end

    if params[:reference][:isManga] == "1"  then
      @Ref.isManga = true
    else
      @Ref.isManga = false
    end

    if file = params[:reference][:cover_data] then
        uploaded_file = params[:reference][:cover_data]
        File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
            file.write(uploaded_file.read)
        end
        @Ref.cover_data = uploaded_file
    end


    if params[:reference][:isLicenced] == "1"  then
      @Ref.isLicenced = true
    else
      @Ref.isLicenced = false
    end

    if params[:reference][:isFr] == "1"  then
      @Ref.isFr = true
    else
      @Ref.isFr = false
    end

    if params[:reference][:isValidated] == "1" then
      @Ref.isValidated = true
    else
      @Ref.isValidated = false
    end

    if params[:reference][:isAnime] == "1"  then
      @Ref.isAnime = true
    else
      @Ref.isAnime = false
    end

    if params[:reference][:sousTitre] then
      @Ref.url = params[:reference][:sousTitre].tr(" ", "_")
    else
      @Ref.url = params[:reference][:titre].tr(" ", "_")
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

      if @selRef.licence_id and @selRef.licence_id != 0 then
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
      params.permit(:titre, :sousTitre, :orgTitre, :url, :synopsis, :licence_id, :note, :isManga, :isFr, :parStatus, :nbVolFr, :nbVolJp, :nbEpTotal, :nbOAVTotal, :nbFIlmsTotal, :studio_id, :licencer_id, :isSponso, :isValidated, :cover_data)
    end
end
