class ChangeAdminUserIndexesToSqlServer < ActiveRecord::Migration
  def up
    remove_index :admin_users, :email
    remove_index :admin_users, :reset_password_token
    execute "CREATE UNIQUE NONCLUSTERED INDEX index_users_on_reset_password_token ON dbo.admin_users (reset_password_token) WHERE reset_password_token IS NOT NULL;"
    execute "CREATE UNIQUE NONCLUSTERED INDEX index_users_on_email ON dbo.admin_users (email) WHERE email IS NOT NULL;"
  end

  def down
    execute "DROP INDEX index_users_on_reset_password_token ON dbo.admin_users;"
    execute "DROP INDEX index_users_on_email ON dbo.admin_users;"
    add_index :admin_users, :email, name: 'index_users_on_email', unique: true
    add_index :admin_users, :reset_password_token, name: 'index_users_on_reset_password_token', unique: true
  end
end
