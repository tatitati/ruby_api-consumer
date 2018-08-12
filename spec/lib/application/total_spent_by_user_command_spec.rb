require "application/total_spent_by_user_command"
require "application/total_spent_by_user_request"

describe "TotalSpentByuserCommand" do
    context "Given a request to search how much spent the user" do
        it "Communicate properly with lower layers (repository in this case) to fetch require data" do

            command = TotalSpentByUserCommand.new(
                TotalSpentByUserRequest.new('user1@domain.com')
            )

          userRepositoryMock = double(UserRepository)
          expect(userRepositoryMock).to receive(:findSpentByUser).with('user1@domain.com')
          command.setRepository(userRepositoryMock)

          command.execute()
        end
    end
end