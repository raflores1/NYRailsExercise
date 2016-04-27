class User < ActiveRecord::Base
  acts_as_voter
  has_secure_password
  has_many :photoposts

  validates_uniqueness_of :email

end
