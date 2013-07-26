class Task < ActiveRecord::Base
  attr_accessible :category_id, :film_duration, :film_name
  belongs_to :category
end
