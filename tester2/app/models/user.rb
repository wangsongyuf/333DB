class User < ActiveRecord::Base
  # /http://www.tutorialspoint.com/ruby-on-rails/rails-input-validations.htm
  include ActiveModel::Validations
  validates_presence_of :first_name, :last_name
  validates_length_of :password,
   :minimum => 8,           # more than 8 characters
   :maximum => 16,          # shorter than 16 characters
   :in => 8..16,            # between 8 and 16 characters
   :too_short => 'way too short. Should have a length of at least 8',
   :too_long => 'way too long. Should have a length of at most 16'
   
  # validates_confirmation_of :password
  validates_uniqueness_of :username,
      :message => 'Already Exist'
  validates_format_of :first_name,
      :with => /[a-zA-Z]/,
      :message => 'Can Only Contain Characters'
  validates_format_of :last_name,
      :with => /[a-zA-Z]/,
      :message => 'Can Only Contain Characters'
  has_secure_password

end
