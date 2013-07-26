class User < ActiveRecord::Base
  attr_accessible :desc, :first_name, :last_name, :title, :email, :password

  has_many :categories
  has_many :tasks

  def full_name
  	"#{first_name} #{last_name}"
  	# [first_name, last_name].join(" ")
  end
end
