require "domain/model/user"
require_relative "../../../builders/user_builder"
require "domain/services/user_service"

describe "UserService" do
    context "Given List of users with different amount of orders we can find the most loyal user" do
        it "provide the most loyal user" do
            users = [
                user1 = UserBuilder.new.withAmountOfOrders(10).build,
                user2 = UserBuilder.new.withAmountOfOrders(20).build,
                user3 = UserBuilder.new.withAmountOfOrders(1).build,
                user4 = UserBuilder.new.withAmountOfOrders(0).build
            ];

            userService = UserService.new
            expect(UserService.new.findMostLoyal(users)).to eql([user2])
        end

        it "EDGE CASE: provide the most loyal user(S) in case that there is multiple users with the same amount of orders" do
            users = [
                user1 = UserBuilder.new.withAmountOfOrders(5).build,
                user2 = UserBuilder.new.withAmountOfOrders(2).build,
                user3 = UserBuilder.new.withAmountOfOrders(5).build
            ];

            userService = UserService.new
            expect(UserService.new.findMostLoyal(users)).to eql([user1, user3])
        end
    end

    context "Given List of users with different amount of orders we can find the most sold item" do
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

    context "Given List of users with different amount of orders" do
        it "it provides how much spent an specific user" do
            users = [
                UserBuilder.new
                .withEmail('email1@domain.com')
                .withOrders([
                    OrderBuilder.new.withPrice(15).build,
                    OrderBuilder.new.withPrice(10).build,
                ]).build,
                UserBuilder.new
                .withEmail('email2@domain.com')
                .withOrders([
                    OrderBuilder.new.withPrice(22).build,
                    OrderBuilder.new.withPrice(100).build,
                ]).build
            ];

            expect(UserService.new.findSpentByUser('email2@domain.com', users)).to eql(122)
        end

        it "EDGE CASE: it cannot provide information about how much spent the user if the user is not in the list" do
            users = [
                UserBuilder.new
                .withEmail('email1@domain.com')
                .withOrders([
                    OrderBuilder.new.withPrice(15).build,
                    OrderBuilder.new.withPrice(10).build,
                ]).build,
                UserBuilder.new
                .withEmail('email2@domain.com')
                .withOrders([
                    OrderBuilder.new.withPrice(22).build,
                    OrderBuilder.new.withPrice(100).build,
                ]).build
            ];

            expect(UserService.new.findSpentByUser('nonexistant_user@domain.com', users)).to eql(nil)
        end
    end
end