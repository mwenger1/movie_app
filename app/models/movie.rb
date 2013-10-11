class Movie < ActiveRecord::Base
	validates_presence_of :title, :description
	validates :description, length: { minimum: 10 } 
	validates_numericality_of :year_released, :greater_than => 0
	validates_numericality_of :rating, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5

	def self.search_for(query)
		where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
	end
end
