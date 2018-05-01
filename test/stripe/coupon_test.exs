# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.CouponTest do
  use ExUnit.Case

  test "should be listable" do
    coupons = Stripe.Coupon.list()
    assert_requested(:get, "#{Stripe.api_base()}/v1/coupons")
    assert coupons.data.is_a?(Array)
    assert coupons.first.is_a?(Stripe.Coupon)
  end

  test "should be retrievable" do
    coupon = Stripe.Coupon.retrieve("25OFF")
    assert_requested(:get, "#{Stripe.api_base()}/v1/coupons/25OFF")
    assert coupon.is_a?(Stripe.Coupon)
  end

  test "should be creatable" do
    coupon =
      Stripe.Coupon.create(
        percent_off: 25,
        duration: "repeating",
        duration_in_months: 3,
        id: "25OFF"
      )

    assert_requested(:post, "#{Stripe.api_base()}/v1/coupons")
    assert coupon.is_a?(Stripe.Coupon)
  end

  test "should be saveable" do
    coupon = Stripe.Coupon.retrieve("25OFF")
    coupon.metadata["key"] = "value"
    coupon.save
    assert_requested(:post, "#{Stripe.api_base()}/v1/coupons/#{coupon.id}")
  end

  test "should be updateable" do
    coupon = Stripe.Coupon.update("25OFF", metadata: %{key: "value"})
    assert_requested(:post, "#{Stripe.api_base()}/v1/coupons/25OFF")
    assert coupon.is_a?(Stripe.Coupon)
  end
end
