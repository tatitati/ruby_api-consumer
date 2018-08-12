require "faraday"
require_relative "purchases_store"

class WebapiPurchasesStore < PurchasesStore
    def initialize()
        @baseUrl = 'https://driftrock-dev-test.herokuapp.com/purchases'
    end

    def findAll
        response = Faraday.get @baseUrl
        WebapiPurchasesMapper.toDomainModel(response.body)
    end
end