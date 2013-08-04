class Task < ActiveRecord::Base
  attr_accessible :category_id, :film_duration, :film_name, :user_id
  belongs_to :category
  belongs_to :user
 

  def category_name
  	category.name if category
  end

  def category_name=(name)
  	self.category = Category.find_or_create_by_name(name) unless name.blank?
  end

  validates :film_name, :film_duration, length: { in: 3..20 }

  validates :film_name, :film_duration, presence: true

  validates :film_name, uniqueness: true

  validates :film_name, uniqueness: { case_sensitive: false }

  validates_presence_of :film_name, :film_duration

end