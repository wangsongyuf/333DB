class User < ActiveRecord::Base
  include ActiveModel::Validations
  validates_presence_of :first_name, :last_name
  validates_length_of :password,
   :minimum => 8           # more than 8 characters
   validates_uniqueness_of :username
  has_secure_password
  
end
