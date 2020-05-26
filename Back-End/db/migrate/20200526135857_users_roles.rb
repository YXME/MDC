class UsersRoles < ActiveRecord::Migration[6.0]
  def change
    add_column(:references, :role, :string, default: "user", null: false)
  end
end
