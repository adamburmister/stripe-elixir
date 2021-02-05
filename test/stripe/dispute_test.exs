# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.DisputeTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # disputes = Stripe.Dispute.list()
    # assert_requested(:get, "#{Stripe.api_base()}/v1/disputes")
    # assert disputes.data.is_a?(Array)
    # assert disputes.first.is_a?(Stripe.Dispute)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # dispute = Stripe.Dispute.retrieve("dp_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/disputes/dp_123")
    # assert dispute.is_a?(Stripe.Dispute)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # dispute = Stripe.Dispute.retrieve("dp_123")
    # dispute.metadata["key"] = "value"
    # dispute.save
    # assert_requested(:post, "#{Stripe.api_base()}/v1/disputes/#{dispute.id}")
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # dispute = Stripe.Dispute.update("dp_123", metadata: %{key: "value"})
    # assert_requested(:post, "#{Stripe.api_base()}/v1/disputes/dp_123")
    # assert dispute.is_a?(Stripe.Dispute)
    needs_refactoring_into_elixir()
  end

  describe "#close" do
    test "should be closeable" do
      # dispute = Stripe.Dispute.retrieve("dp_123")
      # dispute.close
      # assert_requested(:post, "#{Stripe.api_base()}/v1/disputes/#{dispute.id}/close")
      needs_refactoring_into_elixir()
    end
  end
end
