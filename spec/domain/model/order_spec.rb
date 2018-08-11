# spec/string_calculator_spec.rb
require "domain/model/order"
require_relative "../../builders/order_builder"

describe "Order" do
    context "Given initial data information" do
        it "creates an order" do
          order = Order.new('a item name', 15.99)
          expect(order).to be_instance_of(Order)
        end
    end
end