class UsersBio < ActiveRecord::Migration[6.0]
  def change
    add_column(:utilisateurs, :bio, :string, default: "Moi aussi, j'ai mon profil sur MDC !")
  end
end
