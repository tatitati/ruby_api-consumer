require_relative "./aggregate"

class User < Aggregate
    def initialize(id, email, ordersStream = OrderStream.new)
        @id = id
        @email = email
        @ordersStream = ordersStream
    end

    def email
        @email
    end

    def totalSpent()
        @ordersStream.totalSpent
    end

    def countOrders()
        @ordersStream.count
    end

    def listOrderedItems
        @ordersStream.getOrdersName
    end
end