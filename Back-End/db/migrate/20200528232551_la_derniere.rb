class LaDerniere < ActiveRecord::Migration[6.0]
  def change
      change_column(:affiliates, :reference_id, :integer, null: true)

      change_column(:affiliates, :link, :string, null: true)

      change_column(:affiliates, :imageUrl, :text, null: true)

      change_column(:affiliates, :orderNb, :integer, null: true)
  end
end
