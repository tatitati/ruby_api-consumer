require_relative 'command'
require_relative '../infrastructure/domain/user_repository'
require_relative '../infrastructure/domain/purchase_store/webapi_purchases_store'
require_relative '../infrastructure/domain/user_store/webapi_users_store'
require_relative '../domain/services/user_service'

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