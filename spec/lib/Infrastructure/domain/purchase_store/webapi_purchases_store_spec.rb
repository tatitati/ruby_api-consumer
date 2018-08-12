require "infrastructure/domain/purchase_store/webapi_purchases_mapper"
require "infrastructure/domain/purchase_store/webapi_purchases_store"
require "pp"

describe "INTEGRATION TEST: WebapiPurchasesStore" do
    context "Given JSON Response with list of purchases" do
        it "It can create multiple order streams models" do
            store = WebapiPurchasesStore.new(WebapiPurchasesMapper.new)
            purchases = store.findAll()

            expect(purchases.values).to all(be_an(OrderStream))
        end
    end
end