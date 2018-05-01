# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ProductTest do
  use ExUnit.Case

  test "should be listable" do
    products = Stripe.Product.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/products")
    assert products.data.is_a?(Array)
    assert products.data[0].is_a?(Stripe.Product)
  end

  test "should be retrievable" do
    product = Stripe.Product.retrieve("prod_123")
    assert_requested(:get, "#{Stripe.api_base()}/v1/products/prod_123")
    assert product.is_a?(Stripe.Product)
  end

  test "should be creatable" do
    product =
      Stripe.Product.create(
        name: "My Product",
        type: "good"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/products")
    assert product.is_a?(Stripe.Product)
  end

  test "should be saveable" do
    product = Stripe.Product.retrieve("prod_123")
    product.metadata["key"] = "value"
    product.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/products/#{product.id}")
  end

  test "should be updateable" do
    product = Stripe.Product.update("prod_123", metadata: %{foo: "bar"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/products/prod_123")
    assert product.is_a?(Stripe.Product)
  end

  test "should be deletable" do
    product = Stripe.Product.retrieve("prod_123")
    product = product.delete
    assert_requested(:delete, "#{Stripe.api_base()}/v1/products/#{product.id}")
    assert product.is_a?(Stripe.Product)
  end
end
