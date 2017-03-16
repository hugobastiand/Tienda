class Product < ApplicationRecord
	belongs_to :category
	validates :price, presence: true

	before_save :premium_default
	after_destroy :last_product

	scope :premium_all, -> { where(premium: true)}
	scope :last_n, ->(n) { limit(n) } 

	def premium_default
		unless self.premium.present? || self.premium == true
			self.premium = false
		end	
	end	


	def last_product
		categorias = Category.all
		categorias.each do |categoria|
			if categoria.products.empty?
				categoria.destroy
			end	
		end
	end	

	def precio_final
		@precio_final = self.price - ((self.price * self.category.discount).to_f / 100)
		
	end

end
