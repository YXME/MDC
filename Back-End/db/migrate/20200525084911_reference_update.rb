class ReferenceUpdate < ActiveRecord::Migration[6.0]
  def change
    change_column(:references, :isAnime, :boolean, null: false, default: false)
    change_column(:references, :isManga, :boolean, null: false, default: false)
    change_column(:references, :isFr, :boolean, null: false, default: false)
    change_column(:references, :isLicenced, :boolean, null: false, default: false)
  end
end
