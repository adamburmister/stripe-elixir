# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.CountrySpecTest do
  use ExUnit.Case

  test "should be listable" do
    c = Stripe.CountrySpec.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/country_specs")
    assert c.data.is_a?(Array)
    assert c.data[0].is_a?(Stripe.CountrySpec)
  end

  test "should be retrievable" do
    s = Stripe.CountrySpec.retrieve("US")
    assert_requested(:get, "#{Stripe.api_base()}/v1/country_specs/US")
    assert(s.is_a?(Stripe.CountrySpec))
  end
end
