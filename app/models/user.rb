class User < ActiveRecord::Base
  has_many :posts	
  attr_accessible :email, :username, :password, :password_confirmation

  validates :password, presence: true, confirmation: true
end
