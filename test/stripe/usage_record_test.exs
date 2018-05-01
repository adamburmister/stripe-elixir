# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.UsageRecordTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be creatable" do
    usage_record = Stripe ::
      UsageRecord.create(
        quantity: 5000,
        subscription_item: "si_abc",
        timestamp: Time.now().to_i,
        action: "increment"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/subscription_items/si_abc/usage_records")
    assert usage_record.is_a?(Stripe.UsageRecord)
  end

  test "raise when subscription_item is missing" do
    assert_raise ArgumentError do
      Stripe ::
        UsageRecord.create(
          quantity: 5000,
          timestamp: Time.now().to_i,
          action: "increment"
        )
    end
  end
end
