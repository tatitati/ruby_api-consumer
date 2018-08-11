require "faker"

class UserBuilder
    def initialize()
        @eventStream = OrderStreamBuilder.new.build
        @email = Faker::Internet.email
        @id = Faker::String.random([5, 10])
    end

    def withAmountOfOrders(n)
        @eventStream = OrderStreamBuilder.new.withAmountOfOrders(n).build

        self
    end

    def withOrders(ordersList)
        @eventStream = OrderStreamBuilder.new.withOrders(ordersList).build

        self
    end

    def withEmail(email)
        @email = email

        self
    end

    def build()
        User.new(@id, @email, @eventStream)
    end
end