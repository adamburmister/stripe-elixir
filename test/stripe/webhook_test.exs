# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.WebhookTest do
  use ExUnit.Case

  EVENT_PAYLOAD = <<-PAYLOAD.freeze
    %{
      "id": "evt_test_webhook",
      "object": "event"
    }
  PAYLOAD
  SECRET = "whsec_test_secret".freeze

  def generate_header(opts = %{})
    opts[:timestamp] ||= Time.now.to_i
    opts[:payload] ||= EVENT_PAYLOAD
    opts[:secret] ||= SECRET
    opts[:scheme] ||= Stripe.Webhook::Signature::EXPECTED_SCHEME
    opts[:signature] ||= Stripe.Webhook::Signature.send(:compute_signature, "#{opts[:timestamp]}.#{opts[:payload]}", opts[:secret])
    "t=#{opts[:timestamp]},#{opts[:scheme]}=#{opts[:signature]}"
  end

  describe ".construct_event" do
    test "return an Event instance from a valid JSON payload and valid signature header" do
      header = generate_header
      event = Stripe.Webhook.construct_event(EVENT_PAYLOAD, header, SECRET)
      assert event.is_a?(Stripe.Event)
    end

    test "raise a JSON::ParserError from an invalid JSON payload" do
      assert_raises JSON::ParserError do
        payload = "this is not valid JSON"
        header = generate_header(payload: payload)
        Stripe.Webhook.construct_event(payload, header, SECRET)
      end
    end

    test "raise a SignatureVerificationError from a valid JSON payload and an invalid signature header" do
      header = "bad_header"
      assert_raises Stripe.SignatureVerificationError do
        Stripe.Webhook.construct_event(EVENT_PAYLOAD, header, SECRET)
      end
    end
  end

  describe ".verify_signature_header" do
    test "raise a SignatureVerificationError when the header does not have the expected format" do
      header = 'i\'m not even a real signature header'
      e = assert_raises(Stripe.SignatureVerificationError) do
        Stripe.Webhook::Signature.verify_header(EVENT_PAYLOAD, header, "secret")
      end
      assert_match("Unable to extract timestamp and signatures from header", e.message)
    end

    test "raise a SignatureVerificationError when there are no signatures with the expected scheme" do
      header = generate_header(scheme: "v0")
      e = assert_raises(Stripe.SignatureVerificationError) do
        Stripe.Webhook::Signature.verify_header(EVENT_PAYLOAD, header, "secret")
      end
      assert_match("No signatures found with expected scheme", e.message)
    end

    test "raise a SignatureVerificationError when there are no valid signatures for the payload" do
      header = generate_header(signature: "bad_signature")
      e = assert_raises(Stripe.SignatureVerificationError) do
        Stripe.Webhook::Signature.verify_header(EVENT_PAYLOAD, header, "secret")
      end
      assert_match("No signatures found matching the expected signature for payload", e.message)
    end

    test "raise a SignatureVerificationError when the timestamp is not within the tolerance" do
      header = generate_header(timestamp: Time.now.to_i - 15)
      e = assert_raises(Stripe.SignatureVerificationError) do
        Stripe.Webhook::Signature.verify_header(EVENT_PAYLOAD, header, SECRET, tolerance: 10)
      end
      assert_match("Timestamp outside the tolerance zone", e.message)
    end

    test "return true when the header contains a valid signature and the timestamp is within the tolerance" do
      header = generate_header
      assert(Stripe.Webhook::Signature.verify_header(EVENT_PAYLOAD, header, SECRET, tolerance: 10))
    end

    test "return true when the header contains at least one valid signature" do
      header = generate_header + ",v1=bad_signature"
      assert(Stripe.Webhook::Signature.verify_header(EVENT_PAYLOAD, header, SECRET, tolerance: 10))
    end

    test "return true when the header contains a valid signature and the timestamp is off but no tolerance is provided" do
      header = generate_header(timestamp: 12_345)
      assert(Stripe.Webhook::Signature.verify_header(EVENT_PAYLOAD, header, SECRET))
    end
  end
end