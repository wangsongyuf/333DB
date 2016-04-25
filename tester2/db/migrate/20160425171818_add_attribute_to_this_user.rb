class AddAttributeToThisUser < ActiveRecord::Migration
  def change
    add_column :ThisUser, :firstname, :string
  end
end
