class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :string
    add_column :users, :interest, :string
  end
end
