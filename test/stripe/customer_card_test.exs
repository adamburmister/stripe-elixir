# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.CustomerCardTest do
  use ExUnit.Case

  setup do
    @customer = Stripe.Customer.retrieve("cus_123")
  end

  test "should be listable" do
    sources = @customer.sources.list
    assert sources.data.is_a?(Array)
    # because of the terrible :wildcard nature of sources, the API stub
    # cannot currently replace this response with anything meaningful so we
    # don't assert on the type of individual items like we do in other tests
  end

  test "should be creatable" do
    card = @customer.sources.create(source: "tok_123")
    assert_requested(:post, "#{Stripe.api_base()}/v1/customers/#{@customer.id}/sources")
    assert card.is_a?(Stripe.BankAccount)
  end

  test "should be deletable" do
    card = Stripe ::
      Card.construct_from(
        customer: @customer.id,
        id: "card_123"
      )

    card = card.delete

    assert_requested(
      :delete,
      "#{Stripe.api_base()}/v1/customers/#{@customer.id}/sources/card_123"
    )

    assert card.is_a?(Stripe.Card)
  end

  test "should be saveable" do
    card = Stripe ::
      Card.construct_from(
        customer: @customer.id,
        id: "card_123",
        metadata: %{}
      )

    card.metadata["key"] = "value"
    card.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/customers/#{@customer.id}/sources/card_123")
  end
end
