# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.OrderReturnTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # order_returns = Stripe.OrderReturn.list()
    # assert_requested(:get, "#{Stripe.api_base()}/v1/order_returns")
    # assert order_returns.data.is_a?(Array)
    # assert order_returns.data[0].is_a?(Stripe.OrderReturn)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # order_return = Stripe.OrderReturn.retrieve("orret_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/order_returns/orret_123")
    # assert order_return.is_a?(Stripe.OrderReturn)
    needs_refactoring_into_elixir()
  end
end
