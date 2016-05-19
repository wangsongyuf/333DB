class ModificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :showYourComments, :integer
  end
end
