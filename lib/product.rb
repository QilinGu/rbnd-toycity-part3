class Product
	attr_reader :title

	@@products = []
	
	def initialize(options={})
		@title = options[:title]
		add_to_products
	end

	def self.all
		@@products
	end

	private

	def add_to_products
		product = @@products.find {|product| product.title == @title}
		if product
			raise DuplicateProductError, "#{@title} already exists."
		else
			@@products << self
		end
	end
end