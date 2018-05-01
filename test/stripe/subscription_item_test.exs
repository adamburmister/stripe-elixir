# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.SubscriptionItemTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # items = Stripe.SubscriptionItem.list(subscription: "sub_123")

    # assert_requested(
    #   :get,
    #   "#{Stripe.api_base()}/v1/subscription_items",
    #   query: %{subscription: "sub_123"}
    # )

    # assert items.data.is_a?(Array)
    # assert items.data[0].is_a?(Stripe.SubscriptionItem)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # item = Stripe.SubscriptionItem.retrieve("si_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/subscription_items/si_123")
    # assert item.is_a?(Stripe.SubscriptionItem)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # item =
    #   Stripe.SubscriptionItem.create(
    #     item: "silver",
    #     plan: "sapphire-elite",
    #     quantity: 3,
    #     subscription: "sub_123"
    #   )

    # assert_requested(:post, "#{Stripe.api_base()}/v1/subscription_items")
    # assert item.is_a?(Stripe.SubscriptionItem)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # item = Stripe.SubscriptionItem.retrieve("si_123")
    # item.quantity = 4
    # item.save
    # assert_requested(:post, "#{Stripe.api_base()}/v1/subscription_items/#{item.id}")
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # item = Stripe.SubscriptionItem.update("si_123", metadata: %{foo: "bar"})
    # assert_requested(:post, "#{Stripe.api_base()}/v1/subscription_items/si_123")
    # assert item.is_a?(Stripe.SubscriptionItem)
    needs_refactoring_into_elixir()
  end

  test "should be deletable" do
    # item = Stripe.SubscriptionItem.retrieve("si_123")
    # item = item.delete
    # assert_requested(:delete, "#{Stripe.api_base()}/v1/subscription_items/#{item.id}")
    # assert item.is_a?(Stripe.SubscriptionItem)
    needs_refactoring_into_elixir()
  end
end
