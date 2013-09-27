class User < ActiveRecord::Base
  attr_accessible :email, :birthday, :create_date, :full_name, :password, :phone

  has_many :orders, dependent: :destroy
  has_many :comments
end
