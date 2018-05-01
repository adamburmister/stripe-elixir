# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.AccountTest do
  use ExUnit.Case

  test "should be listable" do
    accounts = Stripe.Account.list
    assert_requested :get, "#{Stripe.api_base}/v1/accounts"
    assert accounts.data.is_a?(Array)
    assert accounts.data[0].is_a?(Stripe.Account)
  end

  test "should be retrievable using singular endpoint" do
    account = Stripe.Account.retrieve
    assert_requested :get, "#{Stripe.api_base}/v1/account"
    assert account.is_a?(Stripe.Account)
  end

  test "should be retrievable using plural endpoint" do
    account = Stripe.Account.retrieve("acct_123")
    assert_requested :get, "#{Stripe.api_base}/v1/accounts/acct_123"
    assert account.is_a?(Stripe.Account)
  end

  test "should be rejectable" do
    account_data = %{ id: "acct_foo" }
    stub_request(:get, "#{Stripe.api_base}/v1/accounts/acct_foo")
      .to_return(body: JSON.generate(account_data))

    stub_request(:post, "#{Stripe.api_base}/v1/accounts/acct_foo/reject")
      .to_return(body: JSON.generate(account_data))

    account = Stripe.Account.retrieve("acct_foo")
    account.reject(reason: "fraud")
  end

  test "should be creatable" do
    account = Stripe.Account.create(metadata: %{}, type: "standard")
    assert_requested :post, "#{Stripe.api_base}/v1/accounts"
    assert account.is_a?(Stripe.Account)
  end

  test "should be saveable" do
    account = Stripe.Account.retrieve("acct_123")
    account.metadata["key"] = "value"
    account.save
    assert_requested :post, "#{Stripe.api_base}/v1/accounts/#{account.id}"
  end

  test "should be updateable" do
    account = Stripe.Account.update("acct_123", metadata: %{ foo: "bar" })
    assert_requested :post, "#{Stripe.api_base}/v1/accounts/acct_123"
    assert account.is_a?(Stripe.Account)
  end

  test "should be deletable" do
    account = Stripe.Account.retrieve("acct_123")
    account = account.delete
    assert_requested :delete, "#{Stripe.api_base}/v1/accounts/#{account.id}"
    assert account.is_a?(Stripe.Account)
  end

  describe "#bank_account=" do
    test "warn that #bank_account= is deprecated" do
      old_stderr = $stderr
      $stderr = StringIO.new
      begin
        account = Stripe.Account.retrieve("acct_123")
        account.bank_account = "tok_123"
        message = "NOTE: Stripe.Account#bank_account= is " \
                  "deprecated; use #external_account= instead"
        assert_match Regexp.new(message), $stderr.string
      ensure
        $stderr = old_stderr
      end
    end
  end

  describe "#deauthorize" do
    test "deauthorize an account" do
      account = Stripe.Account.retrieve("acct_123")

      # Unfortunately, the OpenAPI spec doesn't yet cover anything under the
      # Connect endpoints, so for just stub this out with Webmock.
      stub_request(:post, "#{Stripe.connect_base}/oauth/deauthorize")
        .with(body: %{ "client_id" => "ca_1234", "stripe_user_id" => account.id })
        .to_return(body: JSON.generate("stripe_user_id" => account.id))
      account.deauthorize("ca_1234", "sk_test_1234")
    end
  end

  describe "#legal_entity=" do
    test "disallow direct overrides" do
      account = Stripe.Account.retrieve("acct_123")

      assert_raise NoMethodError do
        account.legal_entity = %{ first_name: "Blah" }
      end

      account.legal_entity.first_name = "Blah"
    end
  end

  describe "#serialize_params" do
    test "serialize an a new additional_owners" do
      obj = Stripe.Util.convert_to_stripe_object({
        object: "account",
        legal_entity: Stripe.StripeObject.construct_from({
        }),
      }, %{})
      obj.legal_entity.additional_owners = [
        %{ first_name: "Joe" },
        %{ first_name: "Jane" },
      ]

      expected = %{
        legal_entity: %{
          additional_owners: %{
            "0" => %{ first_name: "Joe" },
            "1" => %{ first_name: "Jane" },
          },
        },
      }
      assert_equal(expected, obj.serialize_params)
    end

    test "serialize on an partially changed additional_owners" do
      obj = Stripe.Util.convert_to_stripe_object({
        object: "account",
        legal_entity: %{
          additional_owners: [
            Stripe.StripeObject.construct_from(first_name: "Joe"),
            Stripe.StripeObject.construct_from(first_name: "Jane"),
          ],
        },
      }, %{})
      obj.legal_entity.additional_owners[1].first_name = "Stripe"

      expected = %{
        legal_entity: %{
          additional_owners: %{
            "1" => %{ first_name: "Stripe" },
          },
        },
      }
      assert_equal(expected, obj.serialize_params)
    end

    test "serialize on an unchanged additional_owners" do
      obj = Stripe.Util.convert_to_stripe_object({
        object: "account",
        legal_entity: %{
          additional_owners: [
            Stripe.StripeObject.construct_from(first_name: "Joe"),
            Stripe.StripeObject.construct_from(first_name: "Jane"),
          ],
        },
      }, %{})

      expected = %{
        legal_entity: %{
          additional_owners: %{},
        },
      }
      assert_equal(expected, obj.serialize_params)
    end

    # Note that the empty string that we send for this one has a special
    # meaning for the server, which interprets it as an array unset.
    test "serialize on an unset additional_owners" do
      obj = Stripe.Util.convert_to_stripe_object({
        object: "account",
        legal_entity: %{
          additional_owners: [
            Stripe.StripeObject.construct_from(first_name: "Joe"),
            Stripe.StripeObject.construct_from(first_name: "Jane"),
          ],
        },
      }, %{})
      obj.legal_entity.additional_owners = nil

      expected = %{
        legal_entity: %{
          additional_owners: "",
        },
      }
      assert_equal(expected, obj.serialize_params)
    end
  end

end
