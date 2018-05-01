# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.BankAccountTest do
  use ExUnit.Case

  describe "#resource_url" do
    test "return an external account URL" do
      bank_account =
        Stripe.BankAccount.construct_from(
          account: "acct_123",
          id: "ba_123"
        )

      assert_equal("/v1/accounts/acct_123/external_accounts/ba_123", bank_account.resource_url)
    end

    test "return a customer URL" do
      bank_account =
        Stripe.BankAccount.construct_from(
          customer: "cus_123",
          id: "ba_123"
        )

      assert_equal("/v1/customers/cus_123/sources/ba_123", bank_account.resource_url)
    end
  end

  describe "#verify" do
    test "verify the account" do
      bank_account =
        Stripe.BankAccount.construct_from(
          customer: "cus_123",
          id: "ba_123"
        )

      bank_account = bank_account.verify(amounts: [1, 2])
      assert bank_account.is_a?(Stripe.BankAccount)
    end
  end
end
