require 'carrierwave/orm/activerecord'

class Affiliate < ActiveRecord::Base
    mount_uploader :image_data, AffiUploader
end
