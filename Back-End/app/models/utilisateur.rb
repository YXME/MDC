class Utilisateur < ActiveRecord::Base
  mount_uploader :pdpUrl, CoverUploader
end
