# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.OrderTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # orders = Stripe.Order.list()
    # assert_requested(:get, "#{Stripe.api_base()}/v1/orders")
    # assert orders.data.is_a?(Array)
    # assert orders.first.is_a?(Stripe.Order)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # order = Stripe.Order.retrieve("or_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/orders/or_123")
    # assert order.is_a?(Stripe.Order)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # order = Stripe.Order.create(currency: "USD")
    # assert_requested(:post, "#{Stripe.api_base()}/v1/orders")
    # assert order.is_a?(Stripe.Order)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # order = Stripe.Order.retrieve("or_123")
    # order.metadata["key"] = "value"
    # order.save
    # assert_requested(:post, "#{Stripe.api_base()}/v1/orders/#{order.id}")
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # order = Stripe.Order.update("or_123", metadata: %{key: "value"})
    # assert_requested(:post, "#{Stripe.api_base()}/v1/orders/or_123")
    # assert order.is_a?(Stripe.Order)
    needs_refactoring_into_elixir()
  end

  describe "#pay" do
    test "pay an order" do
      # order = Stripe.Order.retrieve("or_123")
      # order = order.pay(token: "tok_123")
      # assert order.is_a?(Stripe.Order)
      needs_refactoring_into_elixir()
    end
  end

  describe "#return_order" do
    test "return an order" do
      # order = Stripe.Order.retrieve("or_123")
      #
      # order =
      #   order.return_order(
      #     orders: [
      #       %{parent: "sku_123"}
      #     ]
      #   )
      #
      # assert order.is_a?(Stripe.OrderReturn)
      needs_refactoring_into_elixir()
    end
  end
end
