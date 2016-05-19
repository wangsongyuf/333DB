class AddAttributeToCollege < ActiveRecord::Migration
  def change
    remove_column :College, :male_female_ratio
    add_column :College, :url, :string
    add_column :College, :professor_student_ratio, :decimal, :precision => 8, :scale => 2
  end
end
