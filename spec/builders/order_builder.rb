require 'faker'

class OrderBuilder
    def initialize()
        @name = Faker::Name.name
        @price = Faker::Number.decimal(2)
      end

    def withName(name)
        @name = name
        self
    end

    def withPrice(price)
        @price = price
        self
    end

    def build()
        Order.new(@name, @price)
    end
end