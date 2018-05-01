# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.StripeClientTest do
  import StripeTest.Helpers
  use ExUnit.Case

  describe ".active_client" do
    test "should be .default_client outside of #request" do
      # assert_equal StripeClient.default_client, StripeClient.active_client
      needs_refactoring_into_elixir()
    end

    test "should be active client inside of #request" do
      # client = StripeClient.new
      # client.request do
      #   assert_equal client, StripeClient.active_client
      # end
      needs_refactoring_into_elixir()
    end
  end

  describe ".default_client" do
    test "should be a StripeClient" do
      # assert_kind_of StripeClient, StripeClient.default_client
      needs_refactoring_into_elixir()
    end

    test "should be a different client on each thread" do
      # other_thread_client = nil
      # thread = Thread.new do
      #   other_thread_client = StripeClient.default_client
      # end
      # thread.join
      # refute_equal StripeClient.default_client, other_thread_client
      needs_refactoring_into_elixir()
    end
  end

  describe ".default_conn" do
    test "should be a Faraday::Connection" do
      # assert_kind_of Faraday::Connection, StripeClient.default_conn
      needs_refactoring_into_elixir()
    end

    test "should be a different connection on each thread" do
      # other_thread_conn = nil
      # thread = Thread.new do
      #   other_thread_conn = StripeClient.default_conn
      # end
      # thread.join
      # refute_equal StripeClient.default_conn, other_thread_conn
      needs_refactoring_into_elixir()
    end
  end

  describe ".should_retry?" do
    setup do
      # Stripe.stubs(:max_network_retries).returns(2)
      needs_refactoring_into_elixir()
    end

    test "retry on timeout" do
      # assert StripeClient.should_retry?(Faraday::TimeoutError.new(""), 0)
      needs_refactoring_into_elixir()
    end

    test "retry on a failed connection" do
      # assert StripeClient.should_retry?(Faraday::ConnectionFailed.new(""), 0)
      needs_refactoring_into_elixir()
    end

    test "retry on a conflict" do
      # error = make_rate_limit_error
      # e = Faraday::ClientError.new(error[:error][:message], status: 409)
      # assert StripeClient.should_retry?(e, 0)
      needs_refactoring_into_elixir()
    end

    test "not retry at maximum count" do
      # refute StripeClient.should_retry?(RuntimeError.new, Stripe.max_network_retries)
      needs_refactoring_into_elixir()
    end

    test "not retry on a certificate validation error" do
      # refute StripeClient.should_retry?(Faraday::SSLError.new(""), 0)
      needs_refactoring_into_elixir()
    end
  end

  describe ".sleep_time" do
    test "should grow exponentially" do
      # StripeClient.stubs(:rand).returns(1)
      # Stripe.stubs(:max_network_retry_delay).returns(999)
      # assert_equal(Stripe.initial_network_retry_delay, StripeClient.sleep_time(1))
      # assert_equal(Stripe.initial_network_retry_delay * 2, StripeClient.sleep_time(2))
      # assert_equal(Stripe.initial_network_retry_delay * 4, StripeClient.sleep_time(3))
      # assert_equal(Stripe.initial_network_retry_delay * 8, StripeClient.sleep_time(4))
      needs_refactoring_into_elixir()
    end

    test "enforce the max_network_retry_delay" do
      # StripeClient.stubs(:rand).returns(1)
      # Stripe.stubs(:initial_network_retry_delay).returns(1)
      # Stripe.stubs(:max_network_retry_delay).returns(2)
      # assert_equal(1, StripeClient.sleep_time(1))
      # assert_equal(2, StripeClient.sleep_time(2))
      # assert_equal(2, StripeClient.sleep_time(3))
      # assert_equal(2, StripeClient.sleep_time(4))
      needs_refactoring_into_elixir()
    end

    test "add some randomness" do
      # random_value = 0.8
      # StripeClient.stubs(:rand).returns(random_value)
      # Stripe.stubs(:initial_network_retry_delay).returns(1)
      # Stripe.stubs(:max_network_retry_delay).returns(8)

      # base_value = Stripe.initial_network_retry_delay * (0.5 * (1 + random_value))

      # # the initial value cannot be smaller than the base,
      # # so the randomness is ignored
      # assert_equal(Stripe.initial_network_retry_delay, StripeClient.sleep_time(1))

      # # after the first one, the randomness is applied
      # assert_equal(base_value * 2, StripeClient.sleep_time(2))
      # assert_equal(base_value * 4, StripeClient.sleep_time(3))
      # assert_equal(base_value * 8, StripeClient.sleep_time(4))
      needs_refactoring_into_elixir()
    end
  end

  describe "#initialize" do
    test "set Stripe.default_conn" do
      # client = StripeClient.new
      # assert_equal StripeClient.default_conn, client.conn
      needs_refactoring_into_elixir()
    end

    test "set a different connection if one was specified" do
      # conn = Faraday.new
      # client = StripeClient.new(conn)
      # assert_equal conn, client.conn
      needs_refactoring_into_elixir()
    end
  end

  describe "#execute_request" do
    describe "headers" do
      test "support literal headers" do
        # stub_request(:post, "#{Stripe.api_base}/v1/account")
        #   .with(headers: %{ "Stripe-Account" => "bar" })
        #   .to_return(body: JSON.generate(object: "account"))
        #
        # client = StripeClient.new
        # client.execute_request(:post, "/v1/account",
        #                         headers: %{ "Stripe-Account" => "bar" })
        needs_refactoring_into_elixir()
      end

      test "support RestClient-style header keys" do
        # stub_request(:post, "#{Stripe.api_base}/v1/account")
        #   .with(headers: %{ "Stripe-Account" => "bar" })
        #   .to_return(body: JSON.generate(object: "account"))

        # client = StripeClient.new
        # client.execute_request(:post, "/v1/account",
        #                         headers: %{ stripe_account: "bar" })
        needs_refactoring_into_elixir()
      end
    end

    describe "logging" do
      setup do
        # # Freeze time for the purposes of the `elapsed` parameter that we
        # # emit for responses. I didn't want to bring in a new dependency for
        # # this, but Mocha's `anything` parameter can't match inside of a hash
        # # and is therefore not useful for this purpose. If we switch over to
        # # rspec-mocks at some point, we can probably remove Timecop from the
        # # project.
        # Timecop.freeze(Time.local(1990))
        needs_refactoring_into_elixir()
      end

      # teardown do
      #   Timecop.return
      # end

      test "produce appropriate logging" do
        # body = JSON.generate(object: "account")

        # Util.expects(:log_info).with("Request to Stripe API",
        #                               account: "acct_123",
        #                               api_version: "2010-11-12",
        #                               idempotency_key: "abc",
        #                               method: :post,
        #                               num_retries: 0,
        #                               path: "/v1/account")
        # Util.expects(:log_debug).with("Request details",
        #                               body: "",
        #                               idempotency_key: "abc",
        #                               query_params: nil)

        # Util.expects(:log_info).with("Response from Stripe API",
        #                               account: "acct_123",
        #                               api_version: "2010-11-12",
        #                               elapsed: 0.0,
        #                               idempotency_key: "abc",
        #                               method: :post,
        #                               path: "/v1/account",
        #                               request_id: "req_123",
        #                               status: 200)
        # Util.expects(:log_debug).with("Response details",
        #                               body: body,
        #                               idempotency_key: "abc",
        #                               request_id: "req_123")
        # Util.expects(:log_debug).with("Dashboard link for request",
        #                               idempotency_key: "abc",
        #                               request_id: "req_123",
        #                               url: Util.request_id_dashboard_url("req_123", Stripe.api_key))

        # stub_request(:post, "#{Stripe.api_base}/v1/account")
        #   .to_return(
        #     body: body,
        #     headers: %{
        #       "Idempotency-Key" => "abc",
        #       "Request-Id" => "req_123",
        #       "Stripe-Account" => "acct_123",
        #       "Stripe-Version" => "2010-11-12",
        #     }
        #   )

        # client = StripeClient.new
        # client.execute_request(:post, "/v1/account",
        #                         headers: %{
        #                           "Idempotency-Key" => "abc",
        #                           "Stripe-Account" => "acct_123",
        #                           "Stripe-Version" => "2010-11-12",
        #                         })
        needs_refactoring_into_elixir()
      end

      test "produce logging on API error" do
        # Util.expects(:log_info).with("Request to Stripe API",
        #                               account: nil,
        #                               api_version: nil,
        #                               idempotency_key: nil,
        #                               method: :post,
        #                               num_retries: 0,
        #                               path: "/v1/account")
        # Util.expects(:log_info).with("Response from Stripe API",
        #                               account: nil,
        #                               api_version: nil,
        #                               elapsed: 0.0,
        #                               idempotency_key: nil,
        #                               method: :post,
        #                               path: "/v1/account",
        #                               request_id: nil,
        #                               status: 500)

        # error = %{
        #   code: "code",
        #   message: "message",
        #   param: "param",
        #   type: "type",
        # }
        # Util.expects(:log_error).with("Stripe API error",
        #                               status: 500,
        #                               error_code: error[:code],
        #                               error_message: error[:message],
        #                               error_param: error[:param],
        #                               error_type: error[:type],
        #                               idempotency_key: nil,
        #                               request_id: nil)

        # stub_request(:post, "#{Stripe.api_base}/v1/account")
        #   .to_return(
        #     body: JSON.generate(error: error),
        #     status: 500
        #   )

        # client = StripeClient.new
        # assert_raises Stripe.APIError do
        #   client.execute_request(:post, "/v1/account")
        # end
        needs_refactoring_into_elixir()
      end

      test "produce logging on OAuth error" do
        # Util.expects(:log_info).with("Request to Stripe API",
        #                               account: nil,
        #                               api_version: nil,
        #                               idempotency_key: nil,
        #                               method: :post,
        #                               num_retries: 0,
        #                               path: "/oauth/token")
        # Util.expects(:log_info).with("Response from Stripe API",
        #                               account: nil,
        #                               api_version: nil,
        #                               elapsed: 0.0,
        #                               idempotency_key: nil,
        #                               method: :post,
        #                               path: "/oauth/token",
        #                               request_id: nil,
        #                               status: 400)

        # Util.expects(:log_error).with("Stripe OAuth error",
        #                               status: 400,
        #                               error_code: "invalid_request",
        #                               error_description: "No grant type specified",
        #                               idempotency_key: nil,
        #                               request_id: nil)

        # stub_request(:post, "#{Stripe.connect_base}/oauth/token")
        #   .to_return(body: JSON.generate(error: "invalid_request",
        #                                   error_description: "No grant type specified"), status: 400)

        # client = StripeClient.new
        # opts = %{ api_base: Stripe.connect_base }
        # assert_raises Stripe.OAuth::InvalidRequestError do
        #   client.execute_request(:post, "/oauth/token", opts)
        # end
        needs_refactoring_into_elixir()
      end
    end

    describe "Stripe-Account header" do
      test "use a globally set header" do
        # begin
        #   old = Stripe.stripe_account
        #   Stripe.stripe_account = "acct_1234"

        #   stub_request(:post, "#{Stripe.api_base}/v1/account")
        #     .with(headers: %{ "Stripe-Account" => Stripe.stripe_account })
        #     .to_return(body: JSON.generate(object: "account"))

        #   client = StripeClient.new
        #   client.execute_request(:post, "/v1/account")
        # ensure
        #   Stripe.stripe_account = old
        # end
        needs_refactoring_into_elixir()
      end

      test "use a locally set header" do
        # stripe_account = "acct_0000"
        # stub_request(:post, "#{Stripe.api_base}/v1/account")
        #   .with(headers: %{ "Stripe-Account" => stripe_account })
        #   .to_return(body: JSON.generate(object: "account"))

        # client = StripeClient.new
        # client.execute_request(:post, "/v1/account",
        #                         headers: %{ stripe_account: stripe_account })
        needs_refactoring_into_elixir()
      end

      test "not send it otherwise" do
        # stub_request(:post, "#{Stripe.api_base}/v1/account")
        #   .with do |req|
        #     req.headers["Stripe-Account"].nil?
        #   end.to_return(body: JSON.generate(object: "account"))

        # client = StripeClient.new
        # client.execute_request(:post, "/v1/account")
        needs_refactoring_into_elixir()
      end
    end

    describe "app_info" do
      test "send app_info if set" do
        # begin
        #   old = Stripe.app_info
        #   Stripe.set_app_info(
        #     "MyAwesomePlugin",
        #     url: "https://myawesomeplugin.info",
        #     version: "1.2.34"
        #   )

        #   stub_request(:post, "#{Stripe.api_base}/v1/account")
        #     .with do |req|
        #       assert_equal \
        #         "Stripe/v1 RubyBindings/#{Stripe.VERSION} " \
        #         "MyAwesomePlugin/1.2.34 (https://myawesomeplugin.info)",
        #         req.headers["User-Agent"]

        #       data = JSON.parse(req.headers["X-Stripe-Client-User-Agent"],
        #                         symbolize_names: true)

        #       assert_equal({
        #         name: "MyAwesomePlugin",
        #         url: "https://myawesomeplugin.info",
        #         version: "1.2.34",
        #       }, data[:application])

        #       true
        #     end.to_return(body: JSON.generate(object: "account"))

        #   client = StripeClient.new
        #   client.execute_request(:post, "/v1/account")
        # ensure
        #   Stripe.app_info = old
        # end
        needs_refactoring_into_elixir()
      end
    end

    describe "error handling" do
      test "handle error response with empty body" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: "", status: 500)

        # client = StripeClient.new
        # e = assert_raises Stripe.APIError do
        #   client.execute_request(:post, "/v1/charges")
        # end

        # assert_equal 'Invalid response object from API: "" (HTTP response code was 500)', e.message
        needs_refactoring_into_elixir()
      end

      test "handle success response with empty body" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: "", status: 200)

        # client = StripeClient.new
        # e = assert_raises Stripe.APIError do
        #   client.execute_request(:post, "/v1/charges")
        # end

        # assert_equal 'Invalid response object from API: "" (HTTP response code was 200)', e.message
        needs_refactoring_into_elixir()
      end

      test "handle error response with unknown value" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(bar: "foo"), status: 500)

        # client = StripeClient.new
        # e = assert_raises Stripe.APIError do
        #   client.execute_request(:post, "/v1/charges")
        # end

        # assert_equal 'Invalid response object from API: "{\"bar\":\"foo\"}" (HTTP response code was 500)', e.message
        needs_refactoring_into_elixir()
      end

      test "raise IdempotencyError on 400 of type idempotency_error" do
        # data = make_missing_id_error
        # data[:error][:type] = "idempotency_error"

        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(data), status: 400)
        # client = StripeClient.new

        # e = assert_raises Stripe.IdempotencyError do
        #   client.execute_request(:post, "/v1/charges")
        # end
        # assert_equal(400, e.http_status)
        # assert_equal(true, e.json_body.is_a?(Hash))
        needs_refactoring_into_elixir()
      end

      test "raise InvalidRequestError on other 400s" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(make_missing_id_error), status: 400)
        # client = StripeClient.new
        # begin
        #   client.execute_request(:post, "/v1/charges")
        # rescue Stripe.InvalidRequestError => e
        #   assert_equal(400, e.http_status)
        #   assert_equal(true, e.json_body.is_a?(Hash))
        # end
        needs_refactoring_into_elixir()
      end

      test "raise AuthenticationError on 401" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(make_missing_id_error), status: 401)
        # client = StripeClient.new
        # begin
        #   client.execute_request(:post, "/v1/charges")
        # rescue Stripe.AuthenticationError => e
        #   assert_equal(401, e.http_status)
        #   assert_equal(true, e.json_body.is_a?(Hash))
        # end
        needs_refactoring_into_elixir()
      end

      test "raise CardError on 402" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(make_invalid_exp_year_error), status: 402)
        # client = StripeClient.new
        # begin
        #   client.execute_request(:post, "/v1/charges")
        # rescue Stripe.CardError => e
        #   assert_equal(402, e.http_status)
        #   assert_equal(true, e.json_body.is_a?(Hash))
        #   assert_equal("invalid_expiry_year", e.code)
        #   assert_equal("exp_year", e.param)
        # end
        needs_refactoring_into_elixir()
      end

      test "raise PermissionError on 403" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(make_missing_id_error), status: 403)
        # client = StripeClient.new
        # begin
        #   client.execute_request(:post, "/v1/charges")
        # rescue Stripe.PermissionError => e
        #   assert_equal(403, e.http_status)
        #   assert_equal(true, e.json_body.is_a?(Hash))
        # end
        needs_refactoring_into_elixir()
      end

      test "raise InvalidRequestError on 404" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(make_missing_id_error), status: 404)
        # client = StripeClient.new
        # begin
        #   client.execute_request(:post, "/v1/charges")
        # rescue Stripe.InvalidRequestError => e
        #   assert_equal(404, e.http_status)
        #   assert_equal(true, e.json_body.is_a?(Hash))
        # end
        needs_refactoring_into_elixir()
      end

      test "raise RateLimitError on 429" do
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return(body: JSON.generate(make_rate_limit_error), status: 429)
        # client = StripeClient.new
        # begin
        #   client.execute_request(:post, "/v1/charges")
        # rescue Stripe.RateLimitError => e
        #   assert_equal(429, e.http_status)
        #   assert_equal(true, e.json_body.is_a?(Hash))
        # end
        needs_refactoring_into_elixir()
      end

      test "raise OAuth::InvalidRequestError when error is a string with value 'invalid_request'" do
        # stub_request(:post, "#{Stripe.connect_base}/oauth/token")
        #   .to_return(body: JSON.generate(error: "invalid_request",
        #                                   error_description: "No grant type specified"), status: 400)

        # client = StripeClient.new
        # opts = %{ api_base: Stripe.connect_base }
        # e = assert_raises Stripe.OAuth::InvalidRequestError do
        #   client.execute_request(:post, "/oauth/token", opts)
        # end

        # assert_equal(400, e.http_status)
        # assert_equal("No grant type specified", e.message)
        needs_refactoring_into_elixir()
      end

      test "raise OAuth::InvalidGrantError when error is a string with value 'invalid_grant'" do
        # stub_request(:post, "#{Stripe.connect_base}/oauth/token")
        #   .to_return(body: JSON.generate(error: "invalid_grant",
        #                                   error_description: "This authorization code has already been used. All tokens issued with this code have been revoked."), status: 400)

        # client = StripeClient.new
        # opts = %{ api_base: Stripe.connect_base }
        # e = assert_raises Stripe.OAuth::InvalidGrantError do
        #   client.execute_request(:post, "/oauth/token", opts)
        # end

        # assert_equal(400, e.http_status)
        # assert_equal("invalid_grant", e.code)
        # assert_equal("This authorization code has already been used. All tokens issued with this code have been revoked.", e.message)
        needs_refactoring_into_elixir()
      end

      test "raise OAuth::InvalidClientError when error is a string with value 'invalid_client'" do
        # stub_request(:post, "#{Stripe.connect_base}/oauth/deauthorize")
        #   .to_return(body: JSON.generate(error: "invalid_client",
        #                                   error_description: "This application is not connected to stripe account acct_19tLK7DSlTMT26Mk, or that account does not exist."), status: 401)

        # client = StripeClient.new
        # opts = %{ api_base: Stripe.connect_base }
        # e = assert_raises Stripe.OAuth::InvalidClientError do
        #   client.execute_request(:post, "/oauth/deauthorize", opts)
        # end

        # assert_equal(401, e.http_status)
        # assert_equal("invalid_client", e.code)
        # assert_equal("This application is not connected to stripe account acct_19tLK7DSlTMT26Mk, or that account does not exist.", e.message)
        needs_refactoring_into_elixir()
      end

      test "raise Stripe.OAuthError on indeterminate OAuth error" do
        # stub_request(:post, "#{Stripe.connect_base}/oauth/deauthorize")
        #   .to_return(body: JSON.generate(error: "new_code_not_recognized",
        #                                   error_description: "Something."), status: 401)

        # client = StripeClient.new
        # opts = %{ api_base: Stripe.connect_base }
        # e = assert_raises Stripe.OAuth::OAuthError do
        #   client.execute_request(:post, "/oauth/deauthorize", opts)
        # end

        # assert_equal(401, e.http_status)
        # assert_equal("new_code_not_recognized", e.code)
        # assert_equal("Something.", e.message)
        needs_refactoring_into_elixir()
      end
    end

    describe "idempotency keys" do
      setup do
        # Stripe.stubs(:max_network_retries).returns(2)
        needs_refactoring_into_elixir()
      end

      test "not add an idempotency key to GET requests" do
        # SecureRandom.expects(:uuid).times(0)
        # stub_request(:get, "#{Stripe.api_base}/v1/charges/ch_123")
        #   .with do |req|
        #     req.headers["Idempotency-Key"].nil?
        #   end.to_return(body: JSON.generate(object: "charge"))
        # client = StripeClient.new
        # client.execute_request(:get, "/v1/charges/ch_123")
        needs_refactoring_into_elixir()
      end

      test "ensure there is always an idempotency_key on POST requests" do
        # SecureRandom.expects(:uuid).at_least_once.returns("random_key")
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .with(headers: %{ "Idempotency-Key" => "random_key" })
        #   .to_return(body: JSON.generate(object: "charge"))
        # client = StripeClient.new
        # client.execute_request(:post, "/v1/charges")
        needs_refactoring_into_elixir()
      end

      test "ensure there is always an idempotency_key on DELETE requests" do
        # SecureRandom.expects(:uuid).at_least_once.returns("random_key")
        # stub_request(:delete, "#{Stripe.api_base}/v1/charges/ch_123")
        #   .with(headers: %{ "Idempotency-Key" => "random_key" })
        #   .to_return(body: JSON.generate(object: "charge"))
        # client = StripeClient.new
        # client.execute_request(:delete, "/v1/charges/ch_123")
        needs_refactoring_into_elixir()
      end

      test "not override a provided idempotency_key" do
        # # Note that this expectation looks like `:idempotency_key` instead of
        # # the header `Idempotency-Key` because it's user provided as seen
        # # below. The ones injected by the library itself look like headers
        # # (`Idempotency-Key`), but rest-client does allow this symbol
        # # formatting and will properly override the system generated one as
        # # expected.
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .with(headers: %{ "Idempotency-Key" => "provided_key" })
        #   .to_return(body: JSON.generate(object: "charge"))

        # client = StripeClient.new
        # client.execute_request(:post, "/v1/charges",
        #                         headers: %{ idempotency_key: "provided_key" })
        needs_refactoring_into_elixir()
      end
    end

    describe "retry logic" do
      setup do
        # Stripe.stubs(:max_network_retries).returns(2)
        needs_refactoring_into_elixir()
      end

      test "retry failed requests and raise if error persists" do
        # StripeClient.expects(:sleep_time).at_least_once.returns(0)
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_raise(Errno::ECONNREFUSED.new)

        # client = StripeClient.new
        # err = assert_raises Stripe.APIConnectionError do
        #   client.execute_request(:post, "/v1/charges")
        # end
        # assert_match(/Request was retried 2 times/, err.message)
        needs_refactoring_into_elixir()
      end

      test "retry failed requests and return successful response" do
        # StripeClient.expects(:sleep_time).at_least_once.returns(0)

        # i = 0
        # stub_request(:post, "#{Stripe.api_base}/v1/charges")
        #   .to_return do |_|
        #     if i < 2
        #       i += 1
        #       raise Errno::ECONNREFUSED
        #     else
        #       %{ body: JSON.generate("id" => "myid") }
        #     end
        #   end

        # client = StripeClient.new
        # client.execute_request(:post, "/v1/charges")
        needs_refactoring_into_elixir()
      end
    end

    describe "params serialization" do
      test "allows empty strings in params" do
        # client = StripeClient.new
        # client.execute_request(:get, "/v1/invoices/upcoming", params: %{
        #   customer: "cus_123",
        #   coupon: "",
        # })
        # assert_requested(
        #   :get,
        #   "#{Stripe.api_base}/v1/invoices/upcoming?",
        #   query: %{
        #     customer: "cus_123",
        #     coupon: "",
        #   }
        # )
        needs_refactoring_into_elixir()
      end

      test "filter nils in params" do
        # client = StripeClient.new
        # client.execute_request(:get, "/v1/invoices/upcoming", params: %{
        #   customer: "cus_123",
        #   coupon: nil,
        # })
        # assert_requested(
        #   :get,
        #   "#{Stripe.api_base}/v1/invoices/upcoming?",
        #   query: %{
        #     customer: "cus_123",
        #   }
        # )
        needs_refactoring_into_elixir()
      end
    end
  end

  describe "#request" do
    test "return a result and response object" do
      # stub_request(:post, "#{Stripe.api_base}/v1/charges")
      #   .to_return(body: JSON.generate(object: "charge"))

      # client = StripeClient.new
      # charge, resp = client.request %{ Charge.create }

      # assert charge.is_a?(Charge)
      # assert resp.is_a?(StripeResponse)
      # assert_equal 200, resp.http_status
      needs_refactoring_into_elixir()
    end

    test "return the value of given block" do
      # client = StripeClient.new
      # ret, = client.request %{ 7 }
      # assert_equal 7, ret
      needs_refactoring_into_elixir()
    end

    test "reset local thread state after a call" do
      # begin
      #   Thread.current[:stripe_client] = :stripe_client

      #   client = StripeClient.new
      #   client.request %{}

      #   assert_equal :stripe_client, Thread.current[:stripe_client]
      # ensure
      #   Thread.current[:stripe_client] = nil
      # end
      needs_refactoring_into_elixir()
    end
  end
end
