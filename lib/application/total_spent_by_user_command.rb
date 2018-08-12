require_relative 'command'

class TotalSpentByUserCommand < Command
    def initialize(request)
        @request = request
        @repository = UserRepository.new(
            WebapiUsersStore.new(WebapiPurchasesStore.new),
            UserService.new
        )
    end

    def setRepository(repository)
        @repository = repository
    end

    def execute
        @repository.findSpentByUser(@request.getEmail)
    end
end