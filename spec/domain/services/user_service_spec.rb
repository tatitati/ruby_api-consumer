require "domain/model/user"
require_relative "../../builders/user_builder"
require "domain/services/user_service"

describe "UserService" do
    context "List of users with different amount of orders" do
        it "provide the most loyal user" do
            users = [
                user1 = UserBuilder.new.withAmountOfOrders(15).withEmail('email2@domain.co').build,
                user2 = UserBuilder.new.withAmountOfOrders(10).withEmail('email3@domain.co').build,
                user3 = UserBuilder.new.withAmountOfOrders(20).withEmail('email1@domain.co').build,
                user4 = UserBuilder.new.withAmountOfOrders(1).withEmail('email4@domain.co').build,
                user4 = UserBuilder.new.withAmountOfOrders(0).withEmail('email4@domain.co').build
            ];

            userService = UserService.new
            expect(UserService.new.findMostLoyal(users)).to eql(user3)
        end

        it "GIVEN A list of users with orders, THEN most-sold-item can be found" do
            users = [
                UserBuilder.new.withOrders([
                    OrderBuilder.new.withName('Star Wars').build,
                    OrderBuilder.new.withName('flowers').build
                ]).build,
                UserBuilder.new.withOrders([
                    OrderBuilder.new.withName('Star Wars').build,
                    OrderBuilder.new.withName('meat').build
                ]).build,
                UserBuilder.new.withOrders([
                    OrderBuilder.new.withName('cinema ticket').build
                ]).build
            ];

            expect(UserService.new.findMostSoldItem(users)).to eql('Star Wars')
        end

        it "EDGE CASE:: GIVEN A list of users with no orders, THEN most-sold-item cannot be found" do
            users = [
                UserBuilder.new.withOrders([]).build,
                UserBuilder.new.withOrders([]).build,
                UserBuilder.new.withOrders([]).build
            ];

            expect(UserService.new.findMostSoldItem(users)).to eql(nil)
        end
    end
end