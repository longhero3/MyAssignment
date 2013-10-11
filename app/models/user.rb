class User < ActiveRecord::Base
  before_save :encrypt_password

  attr_accessible :email, :birthday, :create_date, :full_name, :password, :hash_password, :phone, 
  	:username, :password_confirmation, :admin, :confirmation_token, :confirmed_at, :fail_attempts
  attr_accessor :password

  has_many :orders, dependent: :destroy
  has_many :comments

  EMAIL_REGULAR_EXP = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  PHONE_EXP = /^[0-9]+$/i
  validates :username, :presence => true, :uniqueness => true
  validates :full_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGULAR_EXP
  validates :password, :confirmation => true
  validates :phone, :presence => true, :format => PHONE_EXP

  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :stretches => 20
  
  class << self
    def authenticate(username,password)
      user=find_by_username(username)
      return nil unless user 
      typed_hashed_password = BCrypt::Engine.hash_secret(password,user.salt)
      if user && user.hash_password == typed_hashed_password
        user
      elsif user && user.hash_password != typed_hashed_password
        user.fail_attempts -= 1
        user.save
        nil
      else
        nil
      end
    end

    def confirm_user(confirm_token)
      user = find_by_confirmation_token(confirm_token)
      if user 
        user.update_attributes(:confirmed_at => DateTime.now)
        return user
      else
        return nil
      end 
    end
  end

  def is_activated
    return true if confirmed_at != nil
    return false
  end

  def encrypt_password 
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      debugger
      self.hash_password = BCrypt::Engine.hash_secret(password,self.salt)
    end
  end

  def clear_password
  	self.password = nil
  end

  def update_password(password_params)    
    if password_params[:old].empty? || password_params[:new].empty?
      return "Alert: Some Fields are empty"
    else 
      typed_hashed_password = BCrypt::Engine.hash_secret(password_params[:old],salt)
      if typed_hashed_password != hash_password
        return "Alert: Invalid Password"
      elsif password_params[:new] != password_params[:confirm_new]
        return "Alert: New Password and confirm mismatch"
      else
        update_attributes({:password => password_params[:new] })
        return "The new password is updated"
      end    
    end   
  end

  def update_email(email_params)
    if email_params[:old].empty? 
      return "Alert: Your email is empty"
    elsif email_params[:new].empty?
      return "Alert: Your new email is empty"
    elsif !(email_params[:new] =~ EMAIL_REGULAR_EXP) 
      return "Alert: Invalid email format"
    elsif email_params[:password].empty?
      return "Alert: Your password is empty"
    else
      typed_hashed_password = BCrypt::Engine.hash_secret(email_params[:password],salt)
      if hash_password != typed_hashed_password
        return "Alert: Invalid password"
      else
        update_attributes({ :email => email_params[:new] })
        return "Your email has been updated"
      end
    end   
  end
end
