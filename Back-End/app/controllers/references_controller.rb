class ReferencesController < ApplicationController
  def index
    @allRef = Reference.all
  end

  def show
    @selRef = Reference.find_by(url: params[:url])
    @Licence = Licence.find(@selRef.licence_id)


    if @selRef.comments_id then
      @selRef.comments_id.each {|id| @Comments.add(Liste.find(id))}
    end

    if(@selRef.isManga and @selRef.isFr) then
      @Editeur = Editeur.find(@selRef.edition_id)
    end

    if(@selRef.isAnime)
      @Studio = Editeur.find(@selRef.studio_id)
      if(@selRef.isLicenced)
        @Licencer = Editeur.find(@selRef.licencer_id)
      end
    end
  end

  def modify
      @selRef = Reference.find_by(url: params[:url])
  end
end
