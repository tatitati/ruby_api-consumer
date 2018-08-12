require "infrastructure/domain/purchase_store/webapi_purchases_mapper"
require "infrastructure/domain/purchase_store/webapi_purchases_store"
require "infrastructure/domain/user_store/webapi_users_mapper"
require "infrastructure/domain/user_store/webapi_users_store"

describe "INTEGRATION TEST: WebapiUsersStore" do
    context "Given we are in a boundary of our system" do
        it "We need to test that our anticorruption layer works properly and convert any external domain to our own/proper domain lenguage." do

            store = WebapiUsersStore.new(WebapiPurchasesStore.new())
            users = store.findAll()

            expect(users.values).to all(be_an(User))
        end
    end
end