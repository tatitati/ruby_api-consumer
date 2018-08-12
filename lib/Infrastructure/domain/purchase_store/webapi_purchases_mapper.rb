require 'json'
require_relative '../../../domain/model/order'
require_relative '../../../domain/model/order_stream'
require_relative '../../../domain/model/user'

class WebapiPurchasesMapper

    def self.toDomainModel(jsonPurchases)
        purchasesData = JSON.parse(jsonPurchases)['data']

        ordersGroupedByUserId = {}
        purchasesData.each do |purchaseData|
            order = Order.new(purchaseData['item'], purchaseData['spend'].to_f)

            userId = purchaseData['user_id']
            if ordersGroupedByUserId.has_key?(purchaseData['user_id'])
                ordersGroupedByUserId[userId].push(order)
            else
                ordersGroupedByUserId[userId] = [order]
            end
        end

        ordersStream = {}
        ordersGroupedByUserId.each do |userId, ordersPerUser|
            ordersStream[userId] = OrderStream.new(ordersPerUser)
        end

        ordersStream
    end
end