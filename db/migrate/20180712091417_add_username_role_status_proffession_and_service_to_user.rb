class AddUsernameRoleStatusProffessionAndServiceToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :role, :integer
    add_column :users, :status, :integer
    add_column :users, :profession, :string
    add_column :users, :service, :string
  end
end
