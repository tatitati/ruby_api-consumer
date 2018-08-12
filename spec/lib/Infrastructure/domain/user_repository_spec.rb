require "infrastructure/domain/user_repository"
require "infrastructure/domain/user_store/webapi_users_store"

describe "UserRepository" do
    context "Given user store provides a list of users with their orders" do
        it "Can find the most sold item" do
            stubUsersStore = double(WebapiUsersStore)
            allow(stubUsersStore).to receive(:findAll) {
                [
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
                ]
            }

            userRepository = UserRepository.new(stubUsersStore, UserService.new)

            expect(userRepository.findItemMostSold()).to eql('Star Wars')
        end

        it "Can find the most loyal user" do
            giveListOfUsers = [
                user1 = UserBuilder.new.withOrders([
                    OrderBuilder.new.withName('Star Wars').build,
                    OrderBuilder.new.withName('flowers').build
                ]).build,
                user2 = UserBuilder.new.withOrders([
                    OrderBuilder.new.withName('Star Wars').build,
                    OrderBuilder.new.withName('Pencils').build,
                    OrderBuilder.new.withName('meat').build
                ]).build,
                user3 = UserBuilder.new.withOrders([
                    OrderBuilder.new.withName('cinema ticket').build
                ]).build
            ]
            stubUsersStore = double(WebapiUsersStore)
            allow(stubUsersStore).to receive(:findAll) {giveListOfUsers}

            userRepository = UserRepository.new(stubUsersStore, UserService.new)

            expect(userRepository.findItemMostLoyalUser()).to eql([user2])
        end
    end
end