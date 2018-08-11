require "pp"
require 'json'

class WebapiUsersMapper

    def self.toDomainModel(jsonPurchases, purchasesGroupedByuser)
        usersData = JSON.parse(jsonPurchases)['data']

        usersModels = {}
        usersData.each do |userData|

            purchases = OrderStream.new([])
            if purchasesGroupedByuser.has_key?(userData['id'])
                purchases = purchasesGroupedByuser[userData['id']]
            end

            usersModels[userData['email']] = User.new(
                userData['id'],
                userData['email'],
                userData['phone'],
                userData['first_name'],
                userData['last_name'],
                purchases
            )
        end

        usersModels
    end
end