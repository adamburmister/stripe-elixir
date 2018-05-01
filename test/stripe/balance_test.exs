# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.BalanceTest do
  use ExUnit.Case

  test "should be retrievable" do
    balance = Stripe.Balance.retrieve()
    assert_requested(:get, "#{Stripe.api_base()}/v1/balance")
    assert balance.is_a?(Stripe.Balance)
  end
end
