# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ApplicationFeeTest do
  use ExUnit.Case

  test "should be listable" do
    fees = Stripe.ApplicationFee.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/application_fees")
    assert fees.data.is_a?(Array)
    assert fees.data[0].is_a?(Stripe.ApplicationFee)
  end
end
