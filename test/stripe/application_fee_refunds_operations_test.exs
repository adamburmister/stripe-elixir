# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ApplicationFeeRefundsOperationsTest do
  import StripeTest.Helpers
  use ExUnit.Case

  setup do
    # @application_fee_id = "fee_123"
    # @refund_id = "fr_123"
    needs_refactoring_into_elixir()
  end

  describe "#create_refund" do
    test "create a refund" do
      # refund = Stripe.ApplicationFee.create_refund(@application_fee_id)
      #
      # assert_requested(
      #   :post,
      #   "#{Stripe.api_base()}/v1/application_fees/#{@application_fee_id}/refunds"
      # )
      #
      # assert refund.is_a?(Stripe.ApplicationFeeRefund)
      needs_refactoring_into_elixir()
    end
  end

  describe "#retrieve_refund" do
    test "retrieve a refund" do
      # refund =
      #   Stripe.ApplicationFee.retrieve_refund(
      #     @application_fee_id,
      #     @refund_id
      #   )
      #
      # assert_requested(
      #   :get,
      #   "#{Stripe.api_base()}/v1/application_fees/#{@application_fee_id}/refunds/#{@refund_id}"
      # )
      #
      # assert refund.is_a?(Stripe.ApplicationFeeRefund)
      needs_refactoring_into_elixir()
    end
  end

  describe "#update_refund" do
    test "update a refund" do
      # refund =
      #   Stripe.ApplicationFee.update_refund(
      #     @application_fee_id,
      #     @refund_id,
      #     metadata: %{foo: "bar"}
      #   )
      #
      # assert_requested(
      #   :post,
      #   "#{Stripe.api_base()}/v1/application_fees/#{@application_fee_id}/refunds/#{@refund_id}"
      # )
      #
      # assert refund.is_a?(Stripe.ApplicationFeeRefund)
      needs_refactoring_into_elixir()
    end
  end

  describe "#list_refunds" do
    test "list the application fee's refuns" do
      # refunds = Stripe.ApplicationFee.list_refunds(@application_fee_id)
      #
      # assert_requested(
      #   :get,
      #   "#{Stripe.api_base()}/v1/application_fees/#{@application_fee_id}/refunds"
      # )
      #
      # assert refunds.is_a?(Stripe.ListObject)
      # assert refunds.data.is_a?(Array)
      needs_refactoring_into_elixir()
    end
  end
end
