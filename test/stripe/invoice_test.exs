# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.InvoiceTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # invoices = Stripe.Invoice.list
    # assert_requested :get, "#{Stripe.api_base}/v1/invoices"
    # assert invoices.data.is_a?(Array)
    # assert invoices.first.is_a?(Stripe.Invoice)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # invoice = Stripe.Invoice.retrieve("in_123")
    # assert_requested :get, "#{Stripe.api_base}/v1/invoices/in_123"
    # assert invoice.is_a?(Stripe.Invoice)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # invoice = Stripe.Invoice.create(
    #   customer: "cus_123"
    # )
    # assert_requested :post, "#{Stripe.api_base}/v1/invoices"
    # assert invoice.is_a?(Stripe.Invoice)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # invoice = Stripe.Invoice.retrieve("in_123")
    # invoice.metadata["key"] = "value"
    # invoice.save
    # assert_requested :post, "#{Stripe.api_base}/v1/invoices/#{invoice.id}"
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # invoice = Stripe.Invoice.update("in_123", metadata: %{ key: "value" })
    # assert_requested :post, "#{Stripe.api_base}/v1/invoices/in_123"
    # assert invoice.is_a?(Stripe.Invoice)
    needs_refactoring_into_elixir()
  end

  describe "#pay" do
    test "pay invoice" do
      # invoice = Stripe.Invoice.retrieve("in_123")
      # invoice = invoice.pay
      # assert_requested :post,
      #                   "#{Stripe.api_base}/v1/invoices/#{invoice.id}/pay"
      # assert invoice.is_a?(Stripe.Invoice)
      needs_refactoring_into_elixir()
    end

    test "pay invoice with a specific source" do
      # invoice = Stripe.Invoice.retrieve("in_123")
      # invoice = invoice.pay(
      #   source: "src_123"
      # )
      # assert_requested :post,
      #                   "#{Stripe.api_base}/v1/invoices/#{invoice.id}/pay",
      #                   body: %{
      #                     source: "src_123",
      #                   }
      # assert invoice.is_a?(Stripe.Invoice)
      needs_refactoring_into_elixir()
    end
  end

  describe "#upcoming" do
    test "retrieve upcoming invoices" do
      # invoice = Stripe.Invoice.upcoming(
      #   customer: "cus_123",
      #   subscription: "sub_123"
      # )
      # assert_requested :get, "#{Stripe.api_base}/v1/invoices/upcoming",
      #                   query: %{
      #                     customer: "cus_123",
      #                     subscription: "sub_123",
      #                   }
      # assert invoice.is_a?(Stripe.Invoice)
      needs_refactoring_into_elixir()
    end

    test "retrieve upcoming invoices with items" do
      # items = [{
      #   plan: "gold",
      #   quantity: 2,
      # },]
      #
      # invoice = Stripe.Invoice.upcoming(
      #   customer: "cus_123",
      #   subscription_items: items
      # )
      #
      # assert_requested :get, "#{Stripe.api_base}/v1/invoices/upcoming",
      #                   query: %{
      #                     customer: "cus_123",
      #                     subscription_items: [
      #                       %{ plan: "gold", quantity: "2" },
      #                     ],
      #                   }
      # assert invoice.is_a?(Stripe.Invoice)
      needs_refactoring_into_elixir()
    end

    test "should be callable with an empty string" do
      # invoice = Stripe.Invoice.upcoming(
      #   coupon: "",
      #   customer: "cus_123"
      # )
      # assert_requested :get, "#{Stripe.api_base}/v1/invoices/upcoming",
      #                   query: %{
      #                     coupon: "",
      #                     customer: "cus_123",
      #                   }
      # assert invoice.is_a?(Stripe.Invoice)
      needs_refactoring_into_elixir()
    end
  end
end
