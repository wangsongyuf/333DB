class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :email
      t.text :remark

      t.timestamps null: false
    end
  end
end
