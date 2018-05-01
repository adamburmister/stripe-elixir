# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.RecipientTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    recipients = Stripe.Recipient.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/recipients")
    assert recipients.data.is_a?(Array)
    assert recipients.data[0].is_a?(Stripe.Recipient)
  end

  test "should be retrievable" do
    recipient = Stripe.Recipient.retrieve("rp_123")
    assert_requested(:get, "#{Stripe.api_base()}/v1/recipients/rp_123")
    assert recipient.is_a?(Stripe.Recipient)
  end

  test "should be creatable" do
    recipient =
      Stripe.Recipient.create(
        name: "Noah Jackson",
        type: "individual"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/recipients")
    assert recipient.is_a?(Stripe.Recipient)
  end

  test "should be saveable" do
    recipient = Stripe.Recipient.retrieve("rp_123")
    recipient.metadata["key"] = "value"
    recipient.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/recipients/#{recipient.id}")
  end

  test "should be updateable" do
    recipient = Stripe.Recipient.update("rp_123", metadata: %{foo: "bar"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/recipients/rp_123")
    assert recipient.is_a?(Stripe.Recipient)
  end

  test "should be deletable" do
    recipient = Stripe.Recipient.retrieve("rp_123")
    recipient = recipient.delete
    assert_requested(:delete, "#{Stripe.api_base()}/v1/recipients/#{recipient.id}")
    assert recipient.is_a?(Stripe.Recipient)
  end
end
