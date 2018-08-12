class UserRepository
    def initialize (userStore, userService)
        @userStore = userStore
        @userService = userService
    end

    def findItemMostSold()
        users = @userStore.findAll()
        @userService.findMostSoldItem(users)
    end

    def findItemMostLoyalUser()
        users = @userStore.findAll()
        @userService.findMostLoyal(users)
    end

    def findSpentByUser(email)
        users = @userStore.findAll()
        @userService.findSpentByUser(email, users)
    end
end