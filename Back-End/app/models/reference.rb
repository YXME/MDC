class Reference < ActiveRecord::Base
  mount_uploader :imageUrl, CoverUploader
end
