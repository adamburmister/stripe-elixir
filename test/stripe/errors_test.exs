# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.StripeErrorTest do
  use ExUnit.Case

  describe "#to_s" do
    test "convert to string" do
      e = StripeError.new("message")
      assert_equal("message", e.to_s)

      e = StripeError.new("message", http_status: 200)
      assert_equal("(Status 200) message", e.to_s)

      e =
        StripeError.new(
          "message",
          http_status: nil,
          http_body: nil,
          json_body: nil,
          http_headers: %{request_id: "request-id"}
        )

      assert_equal("(Request request-id) message", e.to_s)
    end
  end
end
