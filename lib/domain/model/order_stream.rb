class OrderStream
    def initialize(listOrders = [])
        @listOrders = listOrders
    end

    def count
        @listOrders.length
    end

    def totalSpent
        totalSpent = 0
        @listOrders.each do |value|
            totalSpent += value.price
        end

        totalSpent

    end

    def getOrdersName
        items = []
        @listOrders.each do |order|
            items.push(order.nameItem)
        end

        items
    end
end