class Task < ActiveRecord::Base
  attr_accessible :category_id, :film_duration, :film_name, :user_id
  belongs_to :category
  belongs_to :user
end