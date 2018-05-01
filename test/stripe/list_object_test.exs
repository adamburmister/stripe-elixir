# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.ListObjectTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "provide .empty_list" do
    # list = Stripe.ListObject.empty_list
    # assert list.empty?
    needs_refactoring_into_elixir()
  end

  test "provide #count via enumerable" do
    # list = Stripe.ListObject.construct_from(data: [{ object: "charge" }])
    # assert_equal 1, list.count
    needs_refactoring_into_elixir()
  end

  test "provide #each" do
    # arr = [
    #   %{ id: 1 },
    #   %{ id: 2 },
    #   %{ id: 3 },
    # ]
    # expected = Util.convert_to_stripe_object(arr, %{})
    # list = Stripe.ListObject.construct_from(data: arr)
    # assert_equal expected, list.each.to_a
    needs_refactoring_into_elixir()
  end

  test "provide #auto_paging_each" do
    # arr = [
    #   %{ id: 1 },
    #   %{ id: 2 },
    #   %{ id: 3 },
    # ]
    # expected = Util.convert_to_stripe_object(arr, %{})
    #
    # list = TestListObject.construct_from(data: [{ id: 1 }],
    #                                       has_more: true,
    #                                       url: "/things")
    # stub_request(:get, "#{Stripe.api_base}/things")
    #   .with(query: %{ starting_after: "1" })
    #   .to_return(body: JSON.generate(data: [{ id: 2 }, %{ id: 3 }], has_more: false))
    #
    # assert_equal expected, list.auto_paging_each.to_a
    needs_refactoring_into_elixir()
  end

  test "provide #auto_paging_each that responds to a block" do
    # arr = [
    #   %{ id: 1 },
    #   %{ id: 2 },
    #   %{ id: 3 },
    # ]
    # expected = Util.convert_to_stripe_object(arr, %{})

    # list = TestListObject.construct_from(data: [{ id: 1 }],
    #                                       has_more: true,
    #                                       url: "/things")
    # stub_request(:get, "#{Stripe.api_base}/things")
    #   .with(query: %{ starting_after: "1" })
    #   .to_return(body: JSON.generate(data: [{ id: 2 }, %{ id: 3 }], has_more: false))

    # actual = []
    # list.auto_paging_each do |obj|
    #   actual << obj
    # end

    # assert_equal expected, actual
    needs_refactoring_into_elixir()
  end

  test "provide #empty?" do
    # list = Stripe.ListObject.construct_from(data: [])
    # assert list.empty?
    # list = Stripe.ListObject.construct_from(data: [{}])
    # refute list.empty?
    needs_refactoring_into_elixir()
  end

  #
  # next_page
  #

  test "fetch a next page through #next_page" do
    # list = TestListObject.construct_from(data: [{ id: 1 }],
    #                                       has_more: true,
    #                                       url: "/things")
    # stub_request(:get, "#{Stripe.api_base}/things")
    #   .with(query: %{ starting_after: "1" })
    #   .to_return(body: JSON.generate(data: [{ id: 2 }], has_more: false))
    # next_list = list.next_page
    # refute next_list.empty?
    needs_refactoring_into_elixir()
  end

  test "fetch a next page through #next_page and respect limit" do
    # list = TestListObject.construct_from(data: [{ id: 1 }],
    #                                       has_more: true,
    #                                       url: "/things")
    # list.filters = %{ expand: ["data.source"], limit: 3 }
    # stub_request(:get, "#{Stripe.api_base}/things")
    #   .with(query: %{ "expand[]" => "data.source", "limit" => "3", "starting_after" => "1" })
    #   .to_return(body: JSON.generate(data: [{ id: 2 }], has_more: false))
    # next_list = list.next_page
    # assert_equal({ expand: ["data.source"], limit: 3 }, next_list.filters)
    needs_refactoring_into_elixir()
  end

  test "fetch an empty page through #next_page" do
    # list = TestListObject.construct_from(data: [{ id: 1 }],
    #                                       has_more: false,
    #                                       url: "/things")
    # next_list = list.next_page
    # assert_equal Stripe.ListObject.empty_list, next_list
    needs_refactoring_into_elixir()
  end

  #
  # previous_page
  #

  test "fetch a next page through #previous_page" do
    # list = TestListObject.construct_from(data: [{ id: 2 }],
    #                                       url: "/things")
    # stub_request(:get, "#{Stripe.api_base}/things")
    #   .with(query: %{ ending_before: "2" })
    #   .to_return(body: JSON.generate(data: [{ id: 1 }]))
    # next_list = list.previous_page
    # refute next_list.empty?
    needs_refactoring_into_elixir()
  end

  test "fetch a next page through #previous_page and respect limit" do
    # list = TestListObject.construct_from(data: [{ id: 2 }],
    #                                       url: "/things")
    # list.filters = %{ expand: ["data.source"], limit: 3 }
    # stub_request(:get, "#{Stripe.api_base}/things")
    #   .with(query: %{ "expand[]" => "data.source", "limit" => "3", "ending_before" => "2" })
    #   .to_return(body: JSON.generate(data: [{ id: 1 }]))
    # next_list = list.previous_page
    # assert_equal({ expand: ["data.source"], limit: 3 }, next_list.filters)
    needs_refactoring_into_elixir()
  end

  #
  # backward compatibility
  #

  # note that the name #all is deprecated, as is using it fetch the next page
  # in a list
  test "should be able to retrieve full lists given a listobject" do
    # c = Stripe.Charge.all
    # assert c.is_a?(Stripe.ListObject)
    # assert_equal("/v1/charges", c.resource_url)
    # all = c.all
    # assert all.is_a?(Stripe.ListObject)
    # assert_equal("/v1/charges", all.resource_url)
    # assert all.data.is_a?(Array)
    needs_refactoring_into_elixir()
  end
end

# A helper class with a URL that allows us to try out pagination.
defmodule TestListObject do
  # use Stripe.ListObject
  needs_refactoring_into_elixir()
end
