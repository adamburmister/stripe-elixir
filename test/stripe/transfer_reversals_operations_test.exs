# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.TransferReversalsOperationsTest do
  import StripeTest.Helpers
  use ExUnit.Case

  setup do
    @transfer_id = "tr_123"
    @reversal_id = "trr_123"
  end

  describe "#create_reversal" do
    test "create a reversal" do
      reversal =
        Stripe.Transfer.create_reversal(
          @transfer_id,
          amount: 100
        )

      assert_requested(:post, "#{Stripe.api_base()}/v1/transfers/#{@transfer_id}/reversals")
      assert reversal.is_a?(Stripe.Reversal)
    end
  end

  describe "#retrieve_reversal" do
    test "retrieve a reversal" do
      reversal =
        Stripe.Transfer.retrieve_reversal(
          @transfer_id,
          @reversal_id
        )

      assert_requested(
        :get,
        "#{Stripe.api_base()}/v1/transfers/#{@transfer_id}/reversals/#{@reversal_id}"
      )

      assert reversal.is_a?(Stripe.Reversal)
    end
  end

  describe "#update_reversal" do
    test "update a reversal" do
      reversal =
        Stripe.Transfer.update_reversal(
          @transfer_id,
          @reversal_id,
          metadata: %{foo: "bar"}
        )

      assert_requested(
        :post,
        "#{Stripe.api_base()}/v1/transfers/#{@transfer_id}/reversals/#{@reversal_id}"
      )

      assert reversal.is_a?(Stripe.Reversal)
    end
  end

  describe "#list_reversals" do
    test "list the transfer's reversals" do
      reversals = Stripe.Transfer.list_reversals(@transfer_id)
      assert_requested(:get, "#{Stripe.api_base()}/v1/transfers/#{@transfer_id}/reversals")
      assert reversals.is_a?(Stripe.ListObject)
      assert reversals.data.is_a?(Array)
    end
  end
end
