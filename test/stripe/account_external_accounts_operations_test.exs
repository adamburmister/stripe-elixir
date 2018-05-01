# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.AccountExternalAccountsOperationsTest do
  use ExUnit.Case

  setup do
    @account_id = "acct_123"
    @external_account_id = "ba_123"
  end

  describe "#create_external_account" do
    test "create an external account" do
      external_account =
        Stripe.Account.create_external_account(
          @account_id,
          external_account: "btok_123"
        )

      assert_requested(:post, "#{Stripe.api_base()}/v1/accounts/#{@account_id}/external_accounts")
      assert external_account.is_a?(Stripe.BankAccount)
    end
  end

  describe "#retrieve_external_account" do
    test "retrieve an external account" do
      external_account =
        Stripe.Account.retrieve_external_account(
          @account_id,
          @external_account_id
        )

      assert_requested(
        :get,
        "#{Stripe.api_base()}/v1/accounts/#{@account_id}/external_accounts/#{@external_account_id}"
      )

      assert external_account.is_a?(Stripe.BankAccount)
    end
  end

  describe "#update_external_account" do
    test "update an external account" do
      external_account =
        Stripe.Account.update_external_account(
          @account_id,
          @external_account_id,
          metadata: %{foo: "bar"}
        )

      assert_requested(
        :post,
        "#{Stripe.api_base()}/v1/accounts/#{@account_id}/external_accounts/#{@external_account_id}"
      )

      assert external_account.is_a?(Stripe.BankAccount)
    end
  end

  describe "#delete_external_account" do
    test "delete an external_account" do
      external_account =
        Stripe.Account.delete_external_account(
          @account_id,
          @external_account_id
        )

      assert_requested(
        :delete,
        "#{Stripe.api_base()}/v1/accounts/#{@account_id}/external_accounts/#{@external_account_id}"
      )

      assert external_account.deleted
      assert_equal(@external_account_id, external_account.id)
    end
  end

  describe "#list_external_accounts" do
    test "list the account's external accounts" do
      external_accounts = Stripe.Account.list_external_accounts(@account_id)
      assert_requested(:get, "#{Stripe.api_base()}/v1/accounts/#{@account_id}/external_accounts")
      assert external_accounts.is_a?(Stripe.ListObject)
      assert external_accounts.data.is_a?(Array)
    end
  end
end
