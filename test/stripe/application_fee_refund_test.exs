# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ApplicationFeeRefundTest do
  use ExUnit.Case

  setup do
    @fee = Stripe.ApplicationFee.retrieve("fee_123")
  end

  test "should be listable" do
    refunds = @fee.refunds

    # notably this *doesn't* make an API call
    assert_not_requested(:get, "#{Stripe.api_base()}/v1/application_fees/#{@fee.id}/refunds")

    assert refunds.data.is_a?(Array)
    assert refunds.first.is_a?(Stripe.ApplicationFeeRefund)
  end

  test "should be creatable" do
    refund = @fee.refunds.create
    assert_requested(:post, "#{Stripe.api_base()}/v1/application_fees/#{@fee.id}/refunds")
    assert refund.is_a?(Stripe.ApplicationFeeRefund)
  end

  test "should be saveable" do
    refund = @fee.refunds.first
    refund.metadata["key"] = "value"
    refund.save

    assert_requested(
      :post,
      "#{Stripe.api_base()}/v1/application_fees/#{@fee.id}/refunds/#{refund.id}"
    )
  end
end
