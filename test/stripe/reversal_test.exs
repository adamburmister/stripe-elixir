# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ReversalTest do
  import StripeTest.Helpers
  use ExUnit.Case

  setup do
    # @transfer = Stripe.Transfer.retrieve("tr_123")
    needs_refactoring_into_elixir()
  end

  test "should be listable" do
    # reversals = @transfer.reversals.list
    # assert_requested(:get, "#{Stripe.api_base()}/v1/transfers/#{@transfer.id}/reversals")
    # assert reversals.data.is_a?(Array)
    # assert reversals.data[0].is_a?(Stripe.Reversal)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # reversal = @transfer.reversals.retrieve("trr_123")
    #
    # assert_requested(
    #   :get,
    #   "#{Stripe.api_base()}/v1/transfers/#{@transfer.id}/reversals/trr_123"
    # )
    #
    # assert reversal.is_a?(Stripe.Reversal)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # reversal = @transfer.reversals.create(amount: 100)
    # assert_requested(:post, "#{Stripe.api_base()}/v1/transfers/#{@transfer.id}/reversals")
    # assert reversal.is_a?(Stripe.Reversal)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # reversal = @transfer.reversals.retrieve("trr_123")
    # reversal.metadata["key"] = "value"
    # reversal.save
    #
    # assert_requested(
    #   :post,
    #   "#{Stripe.api_base()}/v1/transfers/#{reversal.transfer}/reversals/#{reversal.id}"
    # )
    needs_refactoring_into_elixir()
  end
end
