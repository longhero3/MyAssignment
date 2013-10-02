class User < ActiveRecord::Base
  before_save :encrypt_password
  after_save :clear_password 
  attr_accessible :email, :birthday, :create_date, :full_name, :password, :phone, 
  	:username, :password_confirmation
  attr_accessor :password
  has_many :orders, dependent: :destroy
  has_many :comments
  EMAIL_REGULAR_EXP = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  PHONE_EXP = /^[0-9]+$/i
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGULAR_EXP
  validates :password, :confirmation => true
  validates :phone, :presence => true, :format => PHONE_EXP
  def encrypt_password 
  	if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hash_password = BCrypt::Engine.hash_secret(password,salt)
  	end
  end

  def clear_password
  	self.password = nil
  end
end
