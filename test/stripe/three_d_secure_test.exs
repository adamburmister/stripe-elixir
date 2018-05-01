# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ThreeDSecureTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be retrievable" do
    # secure = Stripe.ThreeDSecure.retrieve("tdsrc_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/3d_secure/tdsrc_123")
    # assert secure.is_a?(Stripe.ThreeDSecure)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # _ =
    #   Stripe.ThreeDSecure.create(
    #     card: "tok_123",
    #     amount: 1500,
    #     currency: "usd",
    #     return_url: "https://example.org/3d-secure-result"
    #   )

    # assert_requested(:post, "#{Stripe.api_base()}/v1/3d_secure")
    needs_refactoring_into_elixir()
  end
end
