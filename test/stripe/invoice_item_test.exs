# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.InvoiceItemTest do
  use ExUnit.Case

  test "should be listable" do
    invoiceitems = Stripe.InvoiceItem.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/invoiceitems")
    assert invoiceitems.data.is_a?(Array)
    assert invoiceitems.first.is_a?(Stripe.InvoiceItem)
  end

  test "should be retrievable" do
    item = Stripe.InvoiceItem.retrieve("ii_123")
    assert_requested(:get, "#{Stripe.api_base()}/v1/invoiceitems/ii_123")
    assert item.is_a?(Stripe.InvoiceItem)
  end

  test "should be creatable" do
    item =
      Stripe.InvoiceItem.create(
        amount: 100,
        currency: "USD",
        customer: "cus_123"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/invoiceitems")
    assert item.is_a?(Stripe.InvoiceItem)
  end

  test "should be saveable" do
    item = Stripe.InvoiceItem.retrieve("ii_123")
    item.metadata["key"] = "value"
    item.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/invoiceitems/#{item.id}")
  end

  test "should be updateable" do
    item = Stripe.InvoiceItem.update("ii_123", metadata: %{key: "value"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/invoiceitems/ii_123")
    assert item.is_a?(Stripe.InvoiceItem)
  end

  test "should be deletable" do
    item = Stripe.InvoiceItem.retrieve("ii_123")
    item = item.delete
    assert_requested(:delete, "#{Stripe.api_base()}/v1/invoiceitems/#{item.id}")
    assert item.is_a?(Stripe.InvoiceItem)
  end
end
