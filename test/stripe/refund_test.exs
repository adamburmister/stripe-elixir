# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.RefundTest do
  use ExUnit.Case

  test "should be listable" do
    refunds = Stripe.Refund.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/refunds")
    assert refunds.data.is_a?(Array)
    assert refunds.first.is_a?(Stripe.Refund)
  end

  test "should be retrievable" do
    refund = Stripe.Refund.retrieve("re_123")
    assert_requested(:get, "#{Stripe.api_base()}/v1/refunds/re_123")
    assert refund.is_a?(Stripe.Refund)
  end

  test "should be creatable" do
    refund = Stripe.Refund.create(charge: "ch_123")
    assert_requested(:post, "#{Stripe.api_base()}/v1/refunds")
    assert refund.is_a?(Stripe.Refund)
  end

  test "should be saveable" do
    refund = Stripe.Refund.retrieve("re_123")
    refund.metadata["key"] = "value"
    refund.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/refunds/#{refund.id}")
  end

  test "should be updateable" do
    refund = Stripe.Refund.update("re_123", metadata: %{key: "value"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/refunds/re_123")
    assert refund.is_a?(Stripe.Refund)
  end
end
