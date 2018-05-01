# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.PlanTest do
  import StripeTest.Helpers
  use ExUnit.Case

  test "should be listable" do
    # plans = Stripe.Plan.list
    # assert_requested :get, "#{Stripe.api_base}/v1/plans"
    # assert plans.data.is_a?(Array)
    # assert plans.data[0].is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end

  test "should be retrievable" do
    # plan = Stripe.Plan.retrieve("sapphire-elite")
    # assert_requested :get, "#{Stripe.api_base}/v1/plans/sapphire-elite"
    # assert plan.is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end

  test "should be creatable" do
    # plan = Stripe.Plan.create(
    #   amount: 5000,
    #   interval: "month",
    #   name: "Sapphire elite",
    #   currency: "usd",
    #   id: "sapphire-elite"
    # )
    # assert_requested :post, "#{Stripe.api_base}/v1/plans"
    # assert plan.is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end

  test "should be creatable with metered configuration" do
    # plan = Stripe.Plan.create(
    #   amount: 5000,
    #   interval: "month",
    #   name: "Sapphire elite",
    #   currency: "usd",
    #   id: "sapphire-elite",
    #   usage_type: "metered"
    # )
    # assert_requested :post, "#{Stripe.api_base}/v1/plans"
    # assert plan.is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end

  test "should be creatable with tiered configuration" do
    # plan = Stripe.Plan.create(
    #   interval: "month",
    #   name: "Sapphire elite",
    #   currency: "usd",
    #   id: "sapphire-elite",
    #   billing_scheme: "tiered",
    #   tiers_mode: "volume",
    #   tiers: [{ up_to: 100, amount: 1000 }, %{ up_to: "inf", amount: 2000 }]
    # )
    # assert_requested :post, "#{Stripe.api_base}/v1/plans"
    # assert plan.is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end

  test "should be creatable with transform_usage" do
    # plan = Stripe.Plan.create(
    #   interval: "month",
    #   name: "Sapphire elite",
    #   currency: "usd",
    #   id: "sapphire-elite",
    #   amount: 5000,
    #   transform_usage: %{ round: "up", divide_by: 50 }
    # )
    # assert_requested :post, "#{Stripe.api_base}/v1/plans"
    # assert plan.is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end

  test "should be saveable" do
    # plan = Stripe.Plan.retrieve("sapphire-elite")
    # plan.metadata["key"] = "value"
    # plan.save
    # assert_requested :post, "#{Stripe.api_base}/v1/plans/#{plan.id}"
    needs_refactoring_into_elixir()
  end

  test "should be updateable" do
    # plan = Stripe.Plan.update("sapphire-elite", metadata: %{ foo: "bar" })
    # assert_requested :post, "#{Stripe.api_base}/v1/plans/sapphire-elite"
    # assert plan.is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end

  test "should be deletable" do
    # plan = Stripe.Plan.retrieve("sapphire-elite")
    # plan = plan.delete
    # assert_requested :delete, "#{Stripe.api_base}/v1/plans/#{plan.id}"
    # assert plan.is_a?(Stripe.Plan)
    needs_refactoring_into_elixir()
  end
end
