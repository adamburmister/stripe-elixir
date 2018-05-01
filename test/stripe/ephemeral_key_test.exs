# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.EphemeralKeyTest do
  use ExUnit.Case

  describe "#create" do
    test "succeed" do
      key =
        Stripe.EphemeralKey.create(
          %{customer: "cus_123"},
          stripe_version: "2017-05-25"
        )

      assert_requested(
        :post,
        "#{Stripe.api_base()}/v1/ephemeral_keys",
        headers: %{"Stripe-Version" => "2017-05-25"}
      )

      assert key.is_a?(Stripe.EphemeralKey)
    end

    describe "#no global version" do
      test "use the correct api version" do
        key =
          Stripe.EphemeralKey.create(
            %{customer: "cus_123"},
            stripe_version: "2017-06-05"
          )

        assert_requested(
          :post,
          "#{Stripe.api_base()}/v1/ephemeral_keys",
          headers: %{"Stripe-Version" => "2017-06-05"}
        )

        assert key.is_a?(Stripe.EphemeralKey)
      end

      test "error without an explicit api version" do
        e =
          assert_raises(ArgumentError) do
            Stripe.EphemeralKey.create(customer: "cus_123")
          end

        assert_match("stripe_version must be specified", e.message)
      end
    end

    describe "#with global version" do
      setup do
        Stripe.api_version() = "2017-05-25"
      end

      teardown do
        Stripe.api_version() = nil
      end

      test "use the correct api version" do
        key =
          Stripe.EphemeralKey.create(
            %{customer: "cus_123"},
            stripe_version: "2017-05-25"
          )

        assert key.is_a?(Stripe.EphemeralKey)
      end

      test "error without an explicit api version" do
        e =
          assert_raises(ArgumentError) do
            Stripe.EphemeralKey.create(customer: "cus_123")
          end

        assert_match("stripe_version must be specified", e.message)
      end
    end
  end

  describe "#delete" do
    test "succeed" do
      key =
        Stripe.EphemeralKey.create(
          %{customer: "cus_123"},
          stripe_version: "2017-05-25"
        )

      key.delete
      assert_requested(:delete, "#{Stripe.api_base()}/v1/ephemeral_keys/#{key.id}")
    end
  end
end
