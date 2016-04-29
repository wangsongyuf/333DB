class User < ActiveRecord::Base
  # /http://www.tutorialspoint.com/ruby-on-rails/rails-input-validations.htm
  include ActiveModel::Validations
  validates_presence_of :first_name, :last_name
  validates_length_of :password,
   :minimum => 8    ,       # more than 8 characters
   :maximum => 16    ,      # shorter than 16 characters
   :in => 8..16            # between 8 and 16 characters
   
   validates_uniqueness_of :username
   validates_format_of :first_name,
      :with => /[a-zA-Z]/
  validates_format_of :last_name,
      :with => /[a-zA-Z]/
  has_secure_password

end
