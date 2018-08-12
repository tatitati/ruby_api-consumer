require "faraday"
require_relative "users_store"
require_relative "./webapi_users_mapper"

class WebapiUsersStore < UsersStore
    def initialize(webapiPurchasesStore)
        @baseUrl = 'https://driftrock-dev-test.herokuapp.com/users'
        @purchasesStore = webapiPurchasesStore
    end

    def findAll
        purchases = @purchasesStore.findAll()

        responseUsers = Faraday.get @baseUrl
        WebapiUsersMapper.toDomainModel(responseUsers.body, purchases)
    end
end