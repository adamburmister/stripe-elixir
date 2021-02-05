# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.AlipayAccountTest do
  import StripeTest.Helpers
  use ExUnit.Case

  describe "#resource_url" do
    test "return a resource URL" do
      # alipay_account =
      #   Stripe.AlipayAccount.construct_from(
      #     id: "aliacc_123",
      #     customer: "cus_123"
      #   )
      #
      # assert_equal("/v1/customers/cus_123/sources/aliacc_123", alipay_account.resource_url)
      needs_refactoring_into_elixir()
    end

    test "raise without a customer" do
      # alipay_account = Stripe.AlipayAccount.construct_from(id: "aliacc_123")
      #
      # assert_raises NotImplementedError do
      #   alipay_account.resource_url
      # end
      needs_refactoring_into_elixir()
    end
  end

  test "raise on #retrieve" do
    # assert_raises NotImplementedError do
    #   Stripe.AlipayAccount.retrieve("aliacc_123")
    # end
    needs_refactoring_into_elixir()
  end

  test "raise on #update" do
    # assert_raises NotImplementedError do
    #   Stripe.AlipayAccount.update("aliacc_123", %{})
    # end
    needs_refactoring_into_elixir()
  end
end
