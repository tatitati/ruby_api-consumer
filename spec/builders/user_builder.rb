require "faker"
require_relative "builder"

class UserBuilder < Builder
    def initialize()
        @eventStream = OrderStreamBuilder.new.build
        @email = Faker::Internet.email
        @id = Faker::String.random([5, 10])
        @phone = Faker::PhoneNumber.phone_number
        @firstName = Faker::Name.first_name
        @lastName = Faker::Name.last_name
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
        User.new(@id, @email, @phone, @firstName, @lastName, @eventStream)
    end
end