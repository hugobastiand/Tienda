# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Product.destroy_all

3.times do |n|
	Category.create(name: "Categoria #{n}")
end

categories = Category.all
categories.each_with_index do |category, i|
	category.products.build(name: "Producto #{i}", price: (i + 1)*1000).save
end

Product.create(name: "Producto c_1", price: 2990, category: Category.first)
Product.create(name: "Producto c_2", price: 2990, category: Category.second)
Product.create(name: "Producto c_3", price: 2990, category: Category.third)

Product.last.destroy	

a = Product.last
a.premium = true
a.save

b = Category.all
b.each do | categoria |
categoria.name = categoria.name.upcase
categoria.save
end