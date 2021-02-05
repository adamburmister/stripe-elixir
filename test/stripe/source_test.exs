# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.SourceTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be retrievable" do
    # source = Stripe.Source.retrieve("src_123")
    # assert_requested :get, "#{Stripe.api_base}/v1/sources/src_123"
    # assert source.is_a?(Stripe.Source)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # source = Stripe.Source.create(
    #   type: "card",
    #   token: "tok_123"
    # )
    # assert_requested :post, "#{Stripe.api_base}/v1/sources"
    # assert source.is_a?(Stripe.Source)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # source = Stripe.Source.retrieve("src_123")
    # source.metadata["key"] = "value"
    # source.save
    # assert_requested :post, "#{Stripe.api_base}/v1/sources/#{source.id}"
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # source = Stripe.Source.update("src_123", metadata: %{ foo: "bar" })
    # assert_requested :post, "#{Stripe.api_base}/v1/sources/src_123"
    # assert source.is_a?(Stripe.Source)
    needs_refactoring_into_elixir()
  end

  describe "#detach" do
    test "should not be deletable when unattached" do
      # source = Stripe.Source.retrieve("src_123")

      # assert_raises NotImplementedError do
      #   source.detach
      # end
      needs_refactoring_into_elixir()
    end

    test "should be deletable when attached to a customer" do
      # source = Stripe.Source.construct_from(customer: "cus_123",
      #                                         id: "src_123",
      #                                         object: "source")
      # source = source.detach
      # assert_requested :delete, "#{Stripe.api_base}/v1/customers/cus_123/sources/src_123"
      # assert source.is_a?(Stripe.Source)
      needs_refactoring_into_elixir()
    end
  end

  describe "#delete" do
    test "warn that #delete is deprecated" do
      # old_stderr = $stderr
      # $stderr = StringIO.new
      # begin
      #   source = Stripe.Source.construct_from(customer: "cus_123",
      #                                           id: "src_123",
      #                                           object: "source")
      #   source.delete
      #   message = "NOTE: Stripe.Source#delete is " \
      #             "deprecated; use #detach instead"
      #   assert_match Regexp.new(message), $stderr.string
      # ensure
      #   $stderr = old_stderr
      # end
      needs_refactoring_into_elixir()
    end
  end

  test "should not be listable" do
    # assert_raises NoMethodError do
    #   Stripe.Source.list
    # end
    needs_refactoring_into_elixir()
  end

  describe "#verify" do
    test "verify the source" do
      # source = Stripe.Source.retrieve("src_123")
      # source = source.verify(values: [1, 2])
      # assert source.is_a?(Stripe.Source)
      needs_refactoring_into_elixir()
    end
  end
end
