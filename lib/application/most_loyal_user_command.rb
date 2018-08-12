require_relative 'command'

class MostLoyalUserCommand < Command
    def initialize()
        @repository = UserRepository.new(
            WebapiUsersStore.new(WebapiPurchasesStore.new),
            UserService.new
        )
    end

    def setRepository(repository)
        @repository = repository
    end

    def execute
        @repository.findItemMostLoyalUser()
    end
end