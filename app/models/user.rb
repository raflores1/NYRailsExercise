class User < ActiveRecord::Base
  has_secure_password
  has_many :photoposts

  validates_uniqueness_of :email

end
