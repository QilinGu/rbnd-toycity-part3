class Product
	attr_reader :title, :price, :brand
	attr_accessor :stock

	@@products = []
	
	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@brand = options[:brand]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.find_by_title(title)
		@@products.find {|product| product.title == title}
	end

	def self.find_by_brand(brand)
		@@products.select {|product| product.brand == brand}
	end

	def in_stock?
		@stock > 0
	end

	def self.in_stock
		@@products.select {|product| product.in_stock?}
	end

	private

	def add_to_products
		product = self.class.find_by_title(@title)
		if product
			raise DuplicateProductError, "'#{@title}' already exists."
		else
			@@products << self
		end
	end
end