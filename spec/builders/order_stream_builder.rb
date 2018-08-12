require 'faker'
require_relative "builder"

class OrderStreamBuilder < Builder
    def initialize()
        @orders = []
        randomAmountOfOrders = Faker::Number.between(0, 5)

        randomAmountOfOrders.times do |n|
            @orders.push(OrderBuilder.new.build)
        end
    end

    def withOrders(ordersList)
        @orders = ordersList
        self
    end

    def withAmountOfOrders(n)
        @orders = []
        n.times do |n|
            @orders.push(OrderBuilder.new.build)

        end
        self
    end

    def build()
        OrderStream.new(@orders)
    end
end