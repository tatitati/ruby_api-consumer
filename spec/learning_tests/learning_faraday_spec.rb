require "faraday"

describe "Faraday" do
    context "Given a third party api that we don't know how to use [OR] has documentation out of date [OR] might introduce breaking changes in the future" do
        it "describes how to use the functionality we need and the outputs that it produces in the current version. When breaking changes will be also aware of what is failing" do
            response = Faraday.get 'https://driftrock-dev-test.herokuapp.com/users'
            body = JSON.parse(response.body)

            expect(body.keys).to eql(['data'])
        end
    end
end