class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.timestamps null: false
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :username
    end
  end
end
