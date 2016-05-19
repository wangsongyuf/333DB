class AddColumnsToCollege < ActiveRecord::Migration
  def change
    add_column :College, :image_url, :string
  end
end
