class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :CurrentStatus, :string
    add_column :users, :AtYear, :integer
  end
end
