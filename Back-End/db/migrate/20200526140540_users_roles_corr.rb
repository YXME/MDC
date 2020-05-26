class UsersRolesCorr < ActiveRecord::Migration[6.0]
  def change
    add_column(:utilisateurs, :role, :string, default: "user", null: false)
    remove_column(:references, :role)
  end
end
