require_relative 'command'

class MostLoyalSoldItemCommand < Command
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
        @repository.findItemMostSold()
    end
end