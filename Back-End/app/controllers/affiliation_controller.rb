class AffiliationController < ApplicationController
    def index
      @currentUser = Utilisateur.find_by(id: session[:user_id])
      if @currentUser.try(:role) != "admin"
        flash[:error] = "Accès interdit"
        return redirect_to request.referrer || root_path
      end
      @allAffiliates = Affiliate.all
      render :layout => "application"
    end

    def create
      @Aff = Affiliate.create()
      @Aff.reference_id = params[:reference_id].to_i
      @Aff.link = params[:link]
      @Aff.orderNb = params[:orderNb].to_i

      if file = params[:image_data] then
          uploaded_file = params[:image_data]
          File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
              file.write(uploaded_file.read)
          end
          @Aff.image_data = params[:image_data]
      end

      @Aff.save
      redirect_to "/references/index"
    end

    def destroy_affiliation
      Affiliate.find(params[:id]).destroy
      redirect_to "/references/index"
    end
end
