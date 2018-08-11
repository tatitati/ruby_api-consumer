require "pp"
require 'json'

class WebapiMapper

    def self.toDomainModel(jsonPurchases)
        usersData = JSON.parse(jsonPurchases)['data']

        usersModels = []
        usersData.each do |userData|
            usersModels.push(User.new(
                userData['id'],
                userData['email'],
                userData['phone'],
                userData['first_name'],
                userData['last_name']
            ))
        end

        usersModels
    end
end