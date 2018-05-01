# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.CustomerSourcesOperationsTest do
  import StripeTest.Helpers
  use ExUnit.Case

  setup do
    # @customer_id = "cus_123"
    # @source_id = "ba_123"
    needs_refactoring_into_elixir()
  end

  describe "#create_source" do
    test "create a source" do
      # source =
      #   Stripe.Customer.create_source(
      #     @customer_id,
      #     source: "tok_123"
      #   )
      #
      # assert_requested(:post, "#{Stripe.api_base()}/v1/customers/#{@customer_id}/sources")
      # assert source.is_a?(Stripe.BankAccount)
      needs_refactoring_into_elixir()
    end
  end

  describe "#retrieve_source" do
    test "retrieve a source" do
      # source =
      #   Stripe.Customer.retrieve_source(
      #     @customer_id,
      #     @source_id
      #   )
      #
      # assert_requested(
      #   :get,
      #   "#{Stripe.api_base()}/v1/customers/#{@customer_id}/sources/#{@source_id}"
      # )
      #
      # assert source.is_a?(Stripe.BankAccount)
      needs_refactoring_into_elixir()
    end
  end

  describe "#update_source" do
    test "update a source" do
      # source =
      #   Stripe.Customer.update_source(
      #     @customer_id,
      #     @source_id,
      #     metadata: %{foo: "bar"}
      #   )
      #
      # assert_requested(
      #   :post,
      #   "#{Stripe.api_base()}/v1/customers/#{@customer_id}/sources/#{@source_id}"
      # )
      #
      # assert source.is_a?(Stripe.Card)
      needs_refactoring_into_elixir()
    end
  end

  describe "#delete_source" do
    test "delete a source" do
      # source =
      #   Stripe.Customer.delete_source(
      #     @customer_id,
      #     @source_id
      #   )
      #
      # assert_requested(
      #   :delete,
      #   "#{Stripe.api_base()}/v1/customers/#{@customer_id}/sources/#{@source_id}"
      # )
      #
      # assert source.is_a?(Stripe.BankAccount)
      needs_refactoring_into_elixir()
    end
  end

  describe "#list_sources" do
    test "list the customer's sources" do
      # sources = Stripe.Customer.list_sources(@customer_id)
      # assert_requested(:get, "#{Stripe.api_base()}/v1/customers/#{@customer_id}/sources")
      # assert sources.is_a?(Stripe.ListObject)
      # assert sources.data.is_a?(Array)
      needs_refactoring_into_elixir()
    end
  end
end
