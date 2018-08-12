require 'json'

class WebapiUsersMapper
    def self.toDomainModel(jsonUsersResponse, purchasesGroupedByuser)
        usersData = JSON.parse(jsonUsersResponse)['data']

        usersModels = []
        usersData.each do |userData|

            purchasesFouser = OrderStream.new([])
            if purchasesGroupedByuser.has_key?(userData['id'])
                purchasesFouser = purchasesGroupedByuser[userData['id']]
            end

            usersModels.push(User.new(
                userData['id'],
                userData['email'],
                userData['phone'],
                userData['first_name'],
                userData['last_name'],
                purchasesFouser
            ))
        end

        usersModels
    end
end