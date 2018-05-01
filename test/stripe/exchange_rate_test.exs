# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ExchangeRateTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    list_rates = Stripe.ExchangeRate.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/exchange_rates")
    assert list_rates.data.is_a?(Array)
    assert list_rates.data.first.is_a?(Stripe.ExchangeRate)
  end

  test "should be retrievable" do
    rates = Stripe.ExchangeRate.retrieve("usd")
    assert_requested(:get, "#{Stripe.api_base()}/v1/exchange_rates/usd")
    assert rates.is_a?(Stripe.ExchangeRate)
  end
end
