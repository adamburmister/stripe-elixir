# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.SystemProfilerTest do
  import StripeTest.Helpers
  use ExUnit.Case

  describe "#uname" do
    test "run without failure" do
      # # Don't actually check the result because we try a variety of different
      # # strategies that will have different results depending on where this
      # # test and running. We're mostly making sure that no exception is thrown.
      # _ = StripeClient.SystemProfiler.uname()
      needs_refactoring_into_elixir()
    end
  end

  describe "#uname_from_system" do
    test "run without failure" do
      # # as above, just verify that an exception is not thrown
      # _ = StripeClient.SystemProfiler.uname_from_system()
      needs_refactoring_into_elixir()
    end
  end

  describe "#uname_from_system_ver" do
    test "run without failure" do
      # # as above, just verify that an exception is not thrown
      # _ = StripeClient.SystemProfiler.uname_from_system_ver()
      needs_refactoring_into_elixir()
    end
  end
end
