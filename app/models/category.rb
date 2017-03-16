class Category < ApplicationRecord
	has_many :products, dependent: :destroy

	validate :discount_valid

	def discount_valid
		if self.discount < 0 || self.discount > 100
			errors.add(:discount, "El descuento debe ser superior a 0 e inferior a 100")
		end	
	end
end
