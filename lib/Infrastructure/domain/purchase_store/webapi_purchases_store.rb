require "faraday"
require_relative "purchases_store"

class WebapiPurchasesStore < PurchasesStore
    def initialize(webapiPurchasesMapper)
        @baseUrl = 'https://driftrock-dev-test.herokuapp.com/purchases'
        @mapper = webapiPurchasesMapper
    end

    def findAll
        response = Faraday.get @baseUrl
        @mapper.toDomainModel(response.body)        
    end
end