require_relative "./aggregate"

class User < Aggregate
    def initialize(id, email, phone, firstName, lastName, ordersStream = OrderStream.new)
        @id = id
        @email = email
        @phone = phone
        @firstName = firstName
        @lastName = lastName
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