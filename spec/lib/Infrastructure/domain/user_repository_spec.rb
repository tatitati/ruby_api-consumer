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

        it "Can find how much spent a user" do
            giveListOfUsers = [
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
            stubUsersStore = double(WebapiUsersStore)
            allow(stubUsersStore).to receive(:findAll) {giveListOfUsers}

            userRepository = UserRepository.new(stubUsersStore, UserService.new)

            expect(userRepository.findSpentByUser('email2@domain.com')).to eql(122)
        end
    end
end