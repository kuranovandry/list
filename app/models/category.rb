class Category < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  belongs_to :user
  has_many :tasks


  validates :name, length: { in: 3..20 }

  validates :name, presence: true

  validates :name, uniqueness: true

  validates :name, uniqueness: { case_sensitive: false }

  validates_presence_of :name
end