# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.SourceTransactionTest do
  use ExUnit.Case

  setup do
    @source = Stripe.Source.retrieve("src_123")
  end

  test "should be listable" do
    # TODO: remove the stub once stripe-mock supports /v1/sources/src_.../source_transactions
    stub_request(:get, "#{Stripe.api_base()}/v1/sources/#{@source.id}/source_transactions").to_return(
      body:
        JSON.generate(
          object: "list",
          data: [
            %{
              object: "source_transaction"
            }
          ]
        )
    )

    transactions = @source.source_transactions

    assert_requested(:get, "#{Stripe.api_base()}/v1/sources/#{@source.id}/source_transactions")
    assert transactions.data.is_a?(Array)
    assert transactions.first.is_a?(Stripe.SourceTransaction)
  end
end
