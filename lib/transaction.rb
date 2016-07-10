class Transaction
	attr_reader :id, :customer, :product

	@@counter = 1
	@@transactions = []

	def initialize(customer, product)
		@id = @@counter
		@@counter += 1
		@customer = customer
		@product = product
		add_transaction
	end

	def self.all
		@@transactions
	end

	def self.find(id)
		@@transactions.find {|transaction| transaction.id == id}
	end

	def add_transaction
		if @product.stock <= 0
			raise OutOfStockError, "'#{@product.title}' is out of stock."
		else
			@product.stock -= 1
			@@transactions << self
		end
	end
end