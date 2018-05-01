defmodule StripeTest do
  use ExUnit.Case
  doctest Stripe

  test "warn that #refresh_from is deprecated" do
    # COPY-PASTA RUBY ----
    # old_stderr = $stderr
    # $stderr = StringIO.new
    # begin
    #   Stripe.uri_encode({})
    #   message = "NOTE: Stripe.uri_encode is deprecated; use " \
    #             "Stripe::Util#encode_parameters instead"
    #   assert_match Regexp.new(message), $stderr.string
    # ensure
    #   $stderr = old_stderr
    # end
    assert "ruby test" == "not converted to elixir"
  end

  test "allow app_info to be configured" do
    # COPY-PASTA RUBY ----
    # begin
    #   old = Stripe.app_info
    #   Stripe.set_app_info(
    #     "MyAwesomePlugin",
    #     url: "https://myawesomeplugin.info",
    #     version: "1.2.34"
    #   )
    #   assert_equal({
    #     name: "MyAwesomePlugin",
    #     url: "https://myawesomeplugin.info",
    #     version: "1.2.34",
    #   }, Stripe.app_info)
    # ensure
    #   Stripe.app_info = old
    # end
    assert "ruby test" == "not converted to elixir"
  end

  test "allow ca_bundle_path to be configured" do
    # COPY-PASTA RUBY ----
    # begin
    #   old = Stripe.ca_bundle_path
    #   Stripe.ca_bundle_path = "path/to/ca/bundle"
    #   assert_equal "path/to/ca/bundle", Stripe.ca_bundle_path
    # ensure
    #   Stripe.ca_bundle_path = old
    # end
    assert "ruby test" == "not converted to elixir"
  end

  test "allow max_network_retries to be configured" do
    # COPY-PASTA RUBY ----
    # begin
    #   old = Stripe.max_network_retries
    #   Stripe.max_network_retries = 99
    #   assert_equal 99, Stripe.max_network_retries
    # ensure
    #   Stripe.max_network_retries = old
    # end
    assert "ruby test" == "not converted to elixir"
  end

  test "have default open and read timeouts" do
    # COPY-PASTA RUBY ----
    # assert_equal Stripe.open_timeout, 30
    # assert_equal Stripe.read_timeout, 80
    assert "ruby test" == "not converted to elixir"
  end

end
