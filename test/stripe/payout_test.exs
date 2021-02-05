# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.PayoutTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # payouts = Stripe.Payout.list()
    # assert_requested(:get, "#{Stripe.api_base()}/v1/payouts")
    # assert payouts.data.is_a?(Array)
    # assert payouts.data[0].is_a?(Stripe.Payout)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # payout = Stripe.Payout.retrieve("tr_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/payouts/tr_123")
    # assert payout.is_a?(Stripe.Payout)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # payout =
    #   Stripe.Payout.create(
    #     amount: 100,
    #     currency: "USD"
    #   )
    #
    # assert_requested(:post, "#{Stripe.api_base()}/v1/payouts")
    # assert payout.is_a?(Stripe.Payout)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # payout = Stripe.Payout.retrieve("tr_123")
    # payout.metadata["key"] = "value"
    # payout.save
    # assert_requested(:post, "#{Stripe.api_base()}/v1/payouts/#{payout.id}")
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # payout = Stripe.Payout.update("tr_123", metadata: %{foo: "bar"})
    # assert_requested(:post, "#{Stripe.api_base()}/v1/payouts/tr_123")
    # assert payout.is_a?(Stripe.Payout)
    needs_refactoring_into_elixir()
  end

  describe "#cancel" do
    test "cancel a payout" do
      # payout = Stripe.Payout.retrieve("tr_123")
      # payout = payout.cancel
      # assert payout.is_a?(Stripe.Payout)
      needs_refactoring_into_elixir()
    end
  end
end
