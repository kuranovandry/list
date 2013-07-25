class User < ActiveRecord::Base
  attr_accessible :desc, :first_name, :last_name, :title, :email, :password

  has_many :categories
end
