class CommentsUpdate < ActiveRecord::Migration[6.0]
  def change
    create_table :affiliates
    add_column(:affiliates, :reference_id, :integer, null: false)

    add_column(:affiliates, :link, :string, null: false)

    add_column(:affiliates, :imageUrl, :string, null: false)

    add_column(:affiliates, :orderNb, :integer, null: false)

    remove_column(:references, :comments_id)
  end
end
