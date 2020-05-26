class Reference < ActiveRecord::Base
  include ImageUploader::Attachment.new(:cover)
end
