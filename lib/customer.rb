class Customer
	@@customers = []
	
	attr_reader :name

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def self.find_by_name(name)
		@@customers.find {|customer| customer.name == name}
	end

	def self.all
		@@customers
	end

	private

	def add_to_customers
		customer = self.class.find_by_name(@name)
		if customer
			raise DuplicateCustomerError, "'#{@name}' already exists."
		else
			@@customers << self
		end
	end
end