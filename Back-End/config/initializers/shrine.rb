#require "shrine"
#require "shrine/storage/file_system"

#Shrine.storages = {
#  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
#  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
#}

#Shrine.plugin :sequel           # or :activerecord
#Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
