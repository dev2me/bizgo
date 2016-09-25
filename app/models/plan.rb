class Plan < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :num_dias_expires, presence: true
	
end
