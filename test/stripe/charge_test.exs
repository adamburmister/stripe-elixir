# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ChargeTest do
  use ExUnit.Case

  test "should be listable" do
    charges = Stripe.Charge.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/charges")
    assert charges.data.is_a?(Array)
    assert charges.data[0].is_a?(Stripe.Charge)
  end

  test "should be retrievable" do
    charge = Stripe.Charge.retrieve("ch_123")
    assert_requested(:get, "#{Stripe.api_base()}/v1/charges/ch_123")
    assert charge.is_a?(Stripe.Charge)
  end

  test "should be creatable" do
    charge =
      Stripe.Charge.create(
        amount: 100,
        currency: "USD",
        source: "src_123"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/charges")
    assert charge.is_a?(Stripe.Charge)
  end

  test "should be saveable" do
    charge = Stripe.Charge.retrieve("ch_123")
    charge.metadata["key"] = "value"
    charge.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/charges/#{charge.id}")
  end

  test "should be updateable" do
    charge = Stripe.Charge.update("ch_123", metadata: %{foo: "bar"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/charges/ch_123")
    assert charge.is_a?(Stripe.Charge)
  end

  describe "#mark_as_fraudulent" do
    test "charges should be able to be marked as fraudulent" do
      charge = Stripe.Charge.retrieve("ch_123")
      charge = charge.mark_as_fraudulent
      assert charge.is_a?(Stripe.Charge)
    end
  end

  describe "#mark_as_safe" do
    test "charges should be able to be marked as safe" do
      charge = Stripe.Charge.retrieve("ch_123")
      charge = charge.mark_as_safe
      assert charge.is_a?(Stripe.Charge)
    end
  end
end
