require "domain/model/order_stream"
require "infrastructure/domain/purchase_store/webapi_purchases_mapper"
require "pp"

describe "WebapiPurchasesMapper" do
    context "Given JSON Response with list of purchases" do
        it "It can create multiple order streams models" do
            givenPurchasesResponseJson = '{
                "data": [
                    {
                        "item": "Awesome Marble Clock",
                        "spend": "69.44",
                        "user_id": "FFWN-1CKR-X4WU-Q44M"
                    },
                    {
                        "item": "Whatever other book",
                        "spend": "10.33",
                        "user_id": "FFWN-1CKR-X4WU-Q44M"
                    },
                    {
                        "item": "Synergistic Concrete Pants",
                        "spend": "9.87",
                        "user_id": "HEI7-W5NW-OO9S-Z382"
                    }
                ]
            }';

            domainModels = WebapiPurchasesMapper.new.toDomainModel(givenPurchasesResponseJson)

            expect(domainModels.values).to all(be_an(OrderStream))
            expect(domainModels["FFWN-1CKR-X4WU-Q44M"].count).to eql(2)
            expect(domainModels["HEI7-W5NW-OO9S-Z382"].count).to eql(1)
        end
    end
end