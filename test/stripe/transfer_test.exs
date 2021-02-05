# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.TransferTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # transfers = Stripe.Transfer.list()
    # assert_requested(:get, "#{Stripe.api_base()}/v1/transfers")
    # assert transfers.data.is_a?(Array)
    # assert transfers.data[0].is_a?(Stripe.Transfer)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # transfer = Stripe.Transfer.retrieve("tr_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/transfers/tr_123")
    # assert transfer.is_a?(Stripe.Transfer)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # transfer =
    #   Stripe.Transfer.create(
    #     amount: 100,
    #     currency: "USD",
    #     destination: "acct_123"
    #   )

    # assert_requested(:post, "#{Stripe.api_base()}/v1/transfers")
    # assert transfer.is_a?(Stripe.Transfer)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # transfer = Stripe.Transfer.retrieve("tr_123")
    # transfer.metadata["key"] = "value"
    # transfer.save
    # assert_requested(:post, "#{Stripe.api_base()}/v1/transfers/#{transfer.id}")
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # transfer = Stripe.Transfer.update("tr_123", metadata: %{foo: "bar"})
    # assert_requested(:post, "#{Stripe.api_base()}/v1/transfers/tr_123")
    # assert transfer.is_a?(Stripe.Transfer)
    needs_refactoring_into_elixir()
  end
end
