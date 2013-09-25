class User < ActiveRecord::Base
  attr_accessible : email, :birthday, :create_date, :full_name, :password, :phone
end
