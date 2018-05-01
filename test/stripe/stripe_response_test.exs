# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.StripeResponseTest do
  import StripeTest.Helpers
  use ExUnit.Case

  describe ".from_faraday_hash" do
    test "converts to StripeResponse" do
      body = '{"foo": "bar"}'
      headers = %{"Request-Id" => "request-id"}

      http_resp = %{
        body: body,
        headers: headers,
        status: 200
      }

      resp = StripeResponse.from_faraday_hash(http_resp)

      assert_equal(JSON.parse(body, symbolize_names: true), resp.data)
      assert_equal(body, resp.http_body)
      assert_equal(headers, resp.http_headers)
      assert_equal(200, resp.http_status)
      assert_equal("request-id", resp.request_id)
    end
  end

  describe ".from_faraday_response" do
    test "converts to StripeResponse" do
      body = '{"foo": "bar"}'
      headers = %{"Request-Id" => "request-id"}

      env = Faraday :: Env.from(status: 200, body: body, response_headers: headers)
      http_resp = Faraday :: Response.new(env)

      resp = StripeResponse.from_faraday_response(http_resp)

      assert_equal(JSON.parse(body, symbolize_names: true), resp.data)
      assert_equal(body, resp.http_body)
      assert_equal(headers, resp.http_headers)
      assert_equal(200, resp.http_status)
      assert_equal("request-id", resp.request_id)
    end
  end
end
