class User < ActiveRecord::Base
  before_save :encrypt_password
  after_save :clear_password 
  attr_accessible :email, :birthday, :create_date, :full_name, :password, :phone, 
  	:username, :password_confirmation

  has_many :orders, dependent: :destroy
  has_many :comments
  EMAIL_REGULAR_EXP = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGULAR_EXP
  validates :password, :confirmation => true

  def encrypt_password 
  	if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password,salt)
  	end
  end

  def clear_password
  	self.password = nil
  end
end
