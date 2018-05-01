# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.CustomerTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # customers = Stripe.Customer.list()
    # assert_requested(:get, "#{Stripe.api_base()}/v1/customers")
    # assert customers.data.is_a?(Array)
    # assert customers.first.is_a?(Stripe.Customer)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # customer = Stripe.Customer.retrieve("cus_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/customers/cus_123")
    # assert customer.is_a?(Stripe.Customer)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # customer = Stripe.Customer.create()
    # assert_requested(:post, "#{Stripe.api_base()}/v1/customers")
    # assert customer.is_a?(Stripe.Customer)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # customer = Stripe.Customer.retrieve("cus_123")
    # customer.metadata["key"] = "value"
    # customer.save
    # assert_requested(:post, "#{Stripe.api_base()}/v1/customers/#{customer.id}")
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # customer = Stripe.Customer.update("cus_123", metadata: %{key: "value"})
    # assert_requested(:post, "#{Stripe.api_base()}/v1/customers/cus_123")
    # assert customer.is_a?(Stripe.Customer)
    needs_refactoring_into_elixir()
  end

  test "should be deletable" do
    # customer = Stripe.Customer.retrieve("cus_123")
    # customer = customer.delete
    # assert_requested(:delete, "#{Stripe.api_base()}/v1/customers/#{customer.id}")
    # assert customer.is_a?(Stripe.Customer)
    needs_refactoring_into_elixir()
  end

  describe "#create_subscription" do
    test "create a new subscription" do
      # customer = Stripe.Customer.retrieve("cus_123")
      # subscription = customer.create_subscription(plan: "silver")
      # assert subscription.is_a?(Stripe.Subscription)
      needs_refactoring_into_elixir()
    end
  end

  describe "#create_upcoming_invoice" do
    test "create a new invoice" do
      # customer = Stripe.Customer.retrieve("cus_123")
      # invoice = customer.create_upcoming_invoice
      # assert invoice.is_a?(Stripe.Invoice)
      needs_refactoring_into_elixir()
    end
  end

  describe "#update_subscription" do
    test "update a subscription" do
      # customer = Stripe.Customer.retrieve("cus_123")
      #
      # # deprecated API and not in schema
      # stub_request(:post, "#{Stripe.api_base()}/v1/customers/#{customer.id}/subscription").with(
      #   body: %{plan: "silver"}
      # ).to_return(body: JSON.generate(object: "subscription"))
      #
      # subscription = customer.update_subscription(plan: "silver")
      assert subscription.is_a?(Stripe.Subscription)
    end
  end

  describe "#cancel_subscription" do
    test "cancel a subscription" do
      # customer = Stripe.Customer.retrieve("cus_123")
      #
      # # deprecated API and not in schema
      # stub_request(:delete, "#{Stripe.api_base()}/v1/customers/#{customer.id}/subscription").with(
      #   query: %{at_period_end: "true"}
      # ).to_return(body: JSON.generate(object: "subscription"))
      #
      # subscription = customer.cancel_subscription(at_period_end: "true")
      # assert subscription.is_a?(Stripe.Subscription)
      needs_refactoring_into_elixir()
    end
  end

  describe "#delete_discount" do
    test "delete a discount" do
      # customer = Stripe.Customer.retrieve("cus_123")
      #
      # stub_request(:delete, "#{Stripe.api_base()}/v1/customers/#{customer.id}/discount").to_return(
      #   body: JSON.generate(object: "customer")
      # )
      #
      # discount = customer.delete_discount
      # assert discount.is_a?(Stripe.Customer)
      needs_refactoring_into_elixir()
    end
  end

  describe "source field" do
    test "allow setting source with token" do
      # c = Stripe.Customer.new("test_customer")
      # c.source = "tok_123"
      # assert_equal("tok_123", c.source)
      needs_refactoring_into_elixir()
    end

    test "allow setting source with hash and set flag" do
      # c = Stripe.Customer.new("test_customer")
      #
      # c.source = %{
      #   object: "card"
      # }
      #
      # assert_equal(true, c.source.save_with_parent)
      needs_refactoring_into_elixir()
    end
  end
end
