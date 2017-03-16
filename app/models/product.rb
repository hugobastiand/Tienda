class Product < ApplicationRecord
	belongs_to :category
	validates :price, presence: true

	before_save :premium_default

	def premium_default
		unless self.premium.presence? || self.premium == true
			self.premium = false
		end	
	end	
end
