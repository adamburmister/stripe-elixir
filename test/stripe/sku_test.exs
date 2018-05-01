# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.SKUTest do
  use ExUnit.Case

  test "should be listable" do
    skus = Stripe.SKU.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/skus")
    assert skus.data.is_a?(Array)
    assert skus.data[0].is_a?(Stripe.SKU)
  end

  test "should be retrievable" do
    sku = Stripe.SKU.retrieve("sku_123")
    assert_requested(:get, "#{Stripe.api_base()}/v1/skus/sku_123")
    assert sku.is_a?(Stripe.SKU)
  end

  test "should be creatable" do
    _ =
      Stripe.SKU.create(
        currency: "USD",
        inventory: %{type: "finite", quantity: 500},
        price: 100,
        product: "prod_123"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/skus")
  end

  test "should be saveable" do
    sku = Stripe.SKU.retrieve("sku_123")
    sku.metadata["key"] = "value"
    sku.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/skus/#{sku.id}")
  end

  test "should be updateable" do
    sku = Stripe.SKU.update("sku_123", metadata: %{foo: "bar"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/skus/sku_123")
    assert sku.is_a?(Stripe.SKU)
  end

  test "should be deletable" do
    sku = Stripe.SKU.retrieve("sku_123")
    sku = sku.delete
    assert_requested(:delete, "#{Stripe.api_base()}/v1/skus/#{sku.id}")
    assert sku.is_a?(Stripe.SKU)
  end
end
