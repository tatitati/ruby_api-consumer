require "infrastructure/domain/purchase_store/webapi_purchases_store"

describe "INTEGRATION TEST: WebapiPurchasesStore" do
    context "Given we are in a boundary of our system" do
        it "We need to test that our anticorruption layer works properly and convert any external domain to our own/proper domain lenguage." do

            purchases = WebapiPurchasesStore.new.findAll()
            expect(purchases.values).to all(be_an(OrderStream))
        end
    end
end