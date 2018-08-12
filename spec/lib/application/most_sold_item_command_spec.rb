require "application/most_sold_item_command"

describe "MostLoyalUserCommand" do
    context "Given a request to search the most sold item" do
        it "Communicate properly with lower layers (repository in this case) to fetch require data" do

          command = MostLoyalSoldItemCommand.new

          userRepositoryMock = double(UserRepository)
          expect(userRepositoryMock).to receive(:findItemMostSold)
          command.setRepository(userRepositoryMock)

          command.execute()
        end
    end
end