class User < ActiveRecord::Base
  has_many :posts	
  has_secure_password
  attr_accessible :email, :username, :password, :password_confirmation, :id, :score

  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

  # before_save :encrypt_password

  # def has_password?(submitted_password)
  #   self.password_digest == encrypt(submitted_password)
  # end

  # private
  #   def encrypt_password
  #     self.salt = make_salt if new_record?
  #     self.password_digest = encrypt(self.password)
  #   end

  #   def encrypt(password)
  #     secure_hash("#{self.salt}--#{password}") 
  #   end

  #   def secure_hash(string)
  #     Digest::SHA2.hexdigest(string)
  #   end

  #   def make_salt
  #     secure_hash("#{Time.now.utc}--#{self.password}")
  #   end
end
