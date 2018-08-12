require 'json'

class WebapiUsersMapper

    def toDomainModel(jsonPurchases, purchasesGroupedByuser)
        usersData = JSON.parse(jsonPurchases)['data']

        usersModels = {}
        usersData.each do |userData|

            purchasesFouser = OrderStream.new([])
            if purchasesGroupedByuser.has_key?(userData['id'])
                purchasesFouser = purchasesGroupedByuser[userData['id']]
            end

            usersModels[userData['email']] = User.new(
                userData['id'],
                userData['email'],
                userData['phone'],
                userData['first_name'],
                userData['last_name'],
                purchasesFouser
            )
        end

        usersModels
    end
end