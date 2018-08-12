require "application/most_loyal_user_command"

describe "MostLoyalUserCommand" do
    context "Given a request to search the most loyal user" do
        it "Communicate properly with lower layers (repository in this case) to fetch require data" do

          command = MostLoyalUserCommand.new

          userRepostiryMock = double(UserRepository)
          expect(userRepostiryMock).to receive(:findItemMostLoyalUser)
          command.setRepository(userRepostiryMock)

          command.execute()
        end
    end
end