require "domain/model/user"

describe "User" do
    context "Given initial data information" do
        it "creates a user" do
          user = User.new('something', 'email@something.com')
          expect(user).to be_instance_of(User)
          expect(user).to be_kind_of(Aggregate)
          expect(user.email).to eql('email@something.com')
        end
    end

    context "Given ZERO orders of a user" do
        it "Total spent is zero" do
          user = User.new('something', 'email@something.com')
          expect(user.totalSpent).to eql(0)
        end
    end

    context "Given Some orders of a user" do
        it "Can provide a summary about the event stream" do
            user = User.new(
                'something',
                'email@something.com',
                OrderStream.new([
                    OrderBuilder.new.withPrice(100).withName('name1').build,
                    OrderBuilder.new.withPrice(50).withName('name2').build,
                    OrderBuilder.new.withPrice(9).withName('name1').build
                ])
            )
            expect(user.totalSpent).to eql(159)
            expect(user.countOrders).to eql(3)
            expect(user.listOrderedItems).to eql(['name1', 'name2', 'name1'])
        end
    end

    context "EDGE CASE:: Given Some orders of a user" do
        it "Can provide a summary about the event stream" do
            user = User.new(
                'something',
                'email@something.com',
                OrderStream.new([])
            )

            expect(user.listOrderedItems).to eql([])
        end
    end
end