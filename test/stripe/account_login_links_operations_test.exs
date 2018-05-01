# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.AccountLoginLinksOperationsTest do
  use ExUnit.Case

  setup do
    @account_id = "acct_123"
  end

  describe "#create_login_link" do
    test "create a login link" do
      login_link = Stripe.Account.create_login_link(@account_id)
      assert_requested(:post, "#{Stripe.api_base()}/v1/accounts/#{@account_id}/login_links")
      assert login_link.is_a?(Stripe.LoginLink)
    end
  end
end
