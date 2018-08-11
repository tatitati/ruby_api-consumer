require_relative "./aggregate"

class User < Aggregate
    def initialize(id, email, ordersStream = OrderStream.new, phone, firstName, lastName)
        @id = id
        @email = email
        @ordersStream = ordersStream
        @phone = phone
        @firstName = firstName
        @lastName = lastName
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