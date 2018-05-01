# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.TopupTest do
  use ExUnit.Case

  test "should be listable" do
    topups = Stripe.Topup.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/topups")
    assert topups.data.is_a?(Array)
    assert topups.data[0].is_a?(Stripe.Topup)
  end

  test "should be retrievable" do
    topup = Stripe.Topup.retrieve("tu_123")
    assert_requested(:get, "#{Stripe.api_base()}/v1/topups/tu_123")
    assert topup.is_a?(Stripe.Topup)
  end

  test "should be creatable" do
    topup =
      Stripe.Topup.create(
        amount: 100,
        currency: "USD",
        source: "src_123",
        description: "description",
        statement_descriptor: "statement descriptor"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/topups")
    assert topup.is_a?(Stripe.Topup)
  end

  test "should be saveable" do
    topup = Stripe.Topup.retrieve("tu_123")
    topup.metadata["key"] = "value"
    topup.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/topups/#{topup.id}")
  end

  test "should be updateable" do
    topup = Stripe.Topup.update("tu_123", metadata: %{foo: "bar"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/topups/tu_123")
    assert topup.is_a?(Stripe.Topup)
  end
end
