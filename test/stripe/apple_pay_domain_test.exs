# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ApplePayDomainTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # domains = Stripe.ApplePayDomain.list()
    # assert_requested(:get, "#{Stripe.api_base()}/v1/apple_pay/domains")
    # assert domains.data.is_a?(Array)
    # assert domains.data[0].is_a?(Stripe.ApplePayDomain)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # domain = Stripe.ApplePayDomain.retrieve("apwc_123")
    # assert_requested(:get, "#{Stripe.api_base()}/v1/apple_pay/domains/apwc_123")
    # assert domain.is_a?(Stripe.ApplePayDomain)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # domain = Stripe.ApplePayDomain.create(domain_name: "example.com")
    # assert_requested(:post, "#{Stripe.api_base()}/v1/apple_pay/domains")
    # assert domain.is_a?(Stripe.ApplePayDomain)
    needs_refactoring_into_elixir()
  end

  test "should be deletable" do
    # domain = Stripe.ApplePayDomain.retrieve("apwc_123")
    # domain = domain.delete
    # assert_requested(:delete, "#{Stripe.api_base()}/v1/apple_pay/domains/#{domain.id}")
    # assert domain.is_a?(Stripe.ApplePayDomain)
    needs_refactoring_into_elixir()
  end
end
