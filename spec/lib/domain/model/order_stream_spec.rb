require "domain/model/order_stream"
require_relative "../../../builders/order_stream_builder"
require_relative "../../../builders/order_builder"

describe "Order" do
    context "Given No orders" do
        it "We can create an order stream empty" do
          orderStream = OrderStreamBuilder.new.withOrders([]).build
          expect(orderStream).to be_instance_of(OrderStream)
          expect(orderStream.count).to eql(0)
        end
    end

    context "Given Some orders" do
        it "knows the total amount of orders in the stream" do
            expect(getStreamFixture().count).to eql(3)
        end

        it "Knows how much was spent in total" do
            expect(getStreamFixture().totalSpent).to eql(159)
        end
    end
end

def getStreamFixture()
    orderStream = OrderStreamBuilder.new.withOrders([
        OrderBuilder.new.withPrice(100).build(),
        OrderBuilder.new.withPrice(50).build(),
        OrderBuilder.new.withPrice(9).build()
    ]).build

    orderStream
end