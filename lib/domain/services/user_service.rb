class UserService
    def findMostLoyal(usersList)
        mostLoyalUser = nil
        usersList.each do |user|
            if mostLoyalUser == nil
                mostLoyalUser = user
                next
            end

            if user.countOrders > mostLoyalUser.countOrders
                mostLoyalUser = user
            end
        end
        mostLoyalUser
    end

    def findMostSoldItem(usersList)
        summarySoldItems = []
        usersList.each do |user|
            summarySoldItems = summarySoldItems + user.listOrderedItems
        end

        # count ocurrencies o item name
        stats = {}
        summarySoldItems.each do |name|
            if stats.include?(name)
                stats[name] += 1
            else
                stats[name] = 1
            end
        end

        # find item name with maximum amount of ocurrencies
        mostSold = nil
        stats.each do |nameItem, count|
            if mostSold == nil
                mostSold = {"name" => nameItem, "count" => count}
                next
            end

            if count > mostSold['count']
                mostSold = {"name" => nameItem, "count" => count}
            end
        end
        
        if mostSold.nil?
            return nil
        end
        mostSold['name']
    end
end