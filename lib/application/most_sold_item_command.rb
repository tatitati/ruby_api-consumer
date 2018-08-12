require_relative 'command'
require_relative '../infrastructure/domain/user_repository'
require_relative '../infrastructure/domain/purchase_store/webapi_purchases_store'
require_relative '../infrastructure/domain/user_store/webapi_users_store'
require_relative '../domain/services/user_service'

class MostSoldItemCommand < Command
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