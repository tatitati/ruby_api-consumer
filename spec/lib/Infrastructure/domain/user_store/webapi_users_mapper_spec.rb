require "domain/model/order_stream"
require "infrastructure/domain/user_store/webapi_users_mapper"

describe "WebapiUsersMapper" do
    context "Given JSON Response with list of Users" do
        it "It can create multiple users with empty order stream" do
            domainModels = WebapiUsersMapper.new.toDomainModel(getGivenUsersResponseJson(), {})

            expect(domainModels.values.length).to eql(2)
            expect(domainModels.values).to all(be_an(User))
            expect(domainModels["schimmel_quincy@ernser.io"].countOrders).to eql(0)
            expect(domainModels["terry_henry@doyle.io"].countOrders).to eql(0)
        end

        it "It can create multiple users with order stream populated" do
            purchasesGroupedByUser = {"KZHR-1H35-2IH8-JXYN" => OrderStreamBuilder.new.withAmountOfOrders(3).build}
            domainModels = WebapiUsersMapper.new.toDomainModel(getGivenUsersResponseJson(), purchasesGroupedByUser)

            expect(domainModels.values).to all(be_an(User))
            expect(domainModels["schimmel_quincy@ernser.io"].countOrders).to eql(3)
            expect(domainModels["terry_henry@doyle.io"].countOrders).to eql(0)
        end
    end
end

def getGivenUsersResponseJson()
    givenUsersResponseJson = '{
        "data": [
            {
                "email": "schimmel_quincy@ernser.io",
                "first_name": "Quincy",
                "id": "KZHR-1H35-2IH8-JXYN",
                "last_name": "Schimmel",
                "phone": "186.301.6921 x948"
            },
            {
                "email": "terry_henry@doyle.io",
                "first_name": "Henry",
                "id": "S27G-8UMJ-LDSL-UOPN",
                "last_name": "Terry",
                "phone": "636-387-6074 x690"
            }
        ]
    }';

    givenUsersResponseJson
end