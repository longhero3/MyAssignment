class User < ActiveRecord::Base
  before_save :encrypt_password
  after_save :clear_password 
  attr_accessible :email, :birthday, :create_date, :full_name, :password, :phone, 
  	:username, :password_confirmation, :admin
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
      self.hash_password = BCrypt::Engine.hash_secret(password,self.salt)
  	end
  end

  def self.authenticate(username,password)
    user=find_by_username(username)
    typed_hashed_password = BCrypt::Engine.hash_secret(password,user.salt)
    if user && user.hash_password == typed_hashed_password
      user
    else
      nil
    end
  end

  def self.addUser(pending_user_params)
    if User.count == 0
      pending_user_params[:admin] = true
    end
    User.new(pending_user_params)
  end

  def clear_password
  	self.password = nil
  end
end
