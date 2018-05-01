# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ApiOperationsTest do
  import StripeTest.Helpers
  use ExUnit.Case

  # class UpdateableResource < APIResource
  #   include Stripe.APIOperations::Save

  #   def self.protected_fields
  #     [:protected]
  #   end
  # end

  describe ".update" do
    test "post the correct parameters to the resource URL" do
      # stub_request(:post, "#{Stripe.api_base}/v1/updateableresources/id")
      #   .with(body: %{ foo: "bar" })
      #   .to_return(body: JSON.generate(foo: "bar"))
      # resource = UpdateableResource.update("id", foo: "bar")
      # assert_equal("bar", resource.foo)
      needs_refactoring_into_elixir()
    end

    test "error on protected fields" do
      # e = assert_raises do
      #   UpdateableResource.update("id", protected: "bar")
      # end
      # assert_equal "Cannot update protected field: protected", e.message
      needs_refactoring_into_elixir()
    end
  end

  describe ".nested_resource_class_methods" do
    # class MainResource < APIResource
    #   extend Stripe.APIOperations::NestedResource
    #   nested_resource_class_methods :nested,
    #                                 operations: %i[create retrieve update delete list]
    # end

    test "define a create method" do
      # stub_request(:post, "#{Stripe.api_base}/v1/mainresources/id/nesteds")
      #   .with(body: %{ foo: "bar" })
      #   .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "bar"))
      # nested_resource = MainResource.create_nested("id", foo: "bar")
      # assert_equal "bar", nested_resource.foo
      needs_refactoring_into_elixir()
    end

    test "define a retrieve method" do
      # stub_request(:get, "#{Stripe.api_base}/v1/mainresources/id/nesteds/nested_id")
      #   .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "bar"))
      # nested_resource = MainResource.retrieve_nested("id", "nested_id")
      # assert_equal "bar", nested_resource.foo
      needs_refactoring_into_elixir()
    end

    test "define an update method" do
      # stub_request(:post, "#{Stripe.api_base}/v1/mainresources/id/nesteds/nested_id")
      #   .with(body: %{ foo: "baz" })
      #   .to_return(body: JSON.generate(id: "nested_id", object: "nested", foo: "baz"))
      # nested_resource = MainResource.update_nested("id", "nested_id", foo: "baz")
      # assert_equal "baz", nested_resource.foo
      needs_refactoring_into_elixir()
    end

    test "define a delete method" do
      # stub_request(:delete, "#{Stripe.api_base}/v1/mainresources/id/nesteds/nested_id")
      #   .to_return(body: JSON.generate(id: "nested_id", object: "nested", deleted: true))
      # nested_resource = MainResource.delete_nested("id", "nested_id")
      # assert_equal true, nested_resource.deleted
      needs_refactoring_into_elixir()
    end

    test "define a list method" do
      # stub_request(:get, "#{Stripe.api_base}/v1/mainresources/id/nesteds")
      #   .to_return(body: JSON.generate(object: "list", data: []))
      # nested_resources = MainResource.list_nesteds("id")
      # assert nested_resources.data.is_a?(Array)
      needs_refactoring_into_elixir()
    end
  end
end
