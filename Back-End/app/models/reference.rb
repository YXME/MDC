require 'carrierwave/orm/activerecord'

class Reference < ActiveRecord::Base
  #include ImagesUploader::Attachment.new(:cover)
  mount_uploader :cover_data, CoverUploader
end
