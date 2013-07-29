class User < ActiveRecord::Base
  attr_accessible :desc, :first_name, :last_name, :title, :email, :password

  has_many :categories
  has_many :tasks



  validates :first_name, length: { minimum: 2, too_short: "%{count} characters is the minimum allowed" }
  validates :last_name, length: { minimum: 2, too_short: "%{count} characters is the minimum allowed" }
  validates :title, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :desc, length: { maximum: 350, too_long: "%{count} characters is the maximum allowed" }
  validates :password, length: { in: 3..20 }
   
  validates :first_name, :last_name, :email, presence: true
   
  validates :email, :first_name, :last_name, uniqueness: true

  validates :first_name, :last_name, :email, uniqueness: { case_sensitive: false }
  validates :password, uniqueness: { case_sensitive: true }


  
  def full_name
  	"#{first_name} #{last_name}"
  	# [first_name, last_name].join(" ")
  end
end