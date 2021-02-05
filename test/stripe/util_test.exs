# This file was copied from the stripe-ruby code base and still contains Rubyisms
# that need to be converted to Elixirisms. Some of the work has been done already,
# but is not completed.
#
# TODO LIST FOR THIS FILE:
# [ ] Convert Ruby to Elixir
# [ ] Delete this header when done to signify the work is complete
#

defmodule StripeTest.UtilTest do
  import StripeTest.Helpers
  use ExUnit.Case

  describe "OPTS_COPYABLE" do
    test "include :apibase" do
      # assert_include Stripe.Util::OPTS_COPYABLE, :api_base
      needs_refactoring_into_elixir()
    end
  end

  describe "OPTS_PERSISTABLE" do
    test "include :client" do
      # assert_include Stripe.Util::OPTS_PERSISTABLE, :client
      needs_refactoring_into_elixir()
    end

    test "not include :idempotency_key" do
      # refute_includes Stripe.Util::OPTS_PERSISTABLE, :idempotency_key
      needs_refactoring_into_elixir()
    end
  end

  test "#encode_parameters should prepare parameters for an HTTP request" do
    # params = %{
    #   a: 3,
    #   b: "+foo?",
    #   c: "bar&baz",
    #   d: %{ a: "a", b: "b" },
    #   e: [0, 1],
    #   f: "",

    #   # note the empty hash won't even show up in the request
    #   g: [],
    # }
    # assert_equal(
    #   "a=3&b=%2Bfoo%3F&c=bar%26baz&d[a]=a&d[b]=b&e[]=0&e[]=1&f=",
    #   Stripe.Util.encode_parameters(params)
    # )
    needs_refactoring_into_elixir()
  end

  test "#encode_params should throw an error on an array of maps that cannot be encoded" do
    # params = %{
    #   a: [
    #     %{ a: 1, b: 2 },
    #     %{ c: 3, a: 4 },
    #   ],
    # }
    # e = assert_raises(ArgumentError) do
    #   Stripe.Util.encode_parameters(params)
    # end
    # expected = "All maps nested in an array should start with the same key " \
    #             "(expected starting key 'a', got 'c')"
    # assert_equal expected, e.message

    # # Make sure the check is recursive by taking our original params and
    # # nesting it into yet another map and array. Should throw exactly the
    # # same error because it's still the in inner array of maps that's wrong.
    # params = %{
    #   x: [
    #     params,
    #   ],
    # }
    # e = assert_raises(ArgumentError) do
    #   Stripe.Util.encode_parameters(params)
    # end
    # assert_equal expected, e.message
    needs_refactoring_into_elixir()
  end

  test "#url_encode should prepare strings for HTTP" do
    # assert_equal "foo",      Stripe.Util.url_encode("foo")
    # assert_equal "foo",      Stripe.Util.url_encode(:foo)
    # assert_equal "foo%2B",   Stripe.Util.url_encode("foo+")
    # assert_equal "foo%26",   Stripe.Util.url_encode("foo&")
    # assert_equal "foo[bar]", Stripe.Util.url_encode("foo[bar]")
    needs_refactoring_into_elixir()
  end

  test "#flatten_params should encode parameters according to Rails convention" do
    # params = [
    #   [:a, 3],
    #   [:b, "foo?"],
    #   [:c, "bar&baz"],
    #   [:d, %{ a: "a", b: "b" }],
    #   [:e, [0, 1]],
    #   [:f, [
    #     %{ foo: "1", ghi: "2" },
    #     %{ foo: "3", bar: "4" },
    #   ],],
    # ]
    # assert_equal([
    #   ["a", 3],
    #   ["b",        "foo?"],
    #   ["c",        "bar&baz"],
    #   ["d[a]",     "a"],
    #   ["d[b]",     "b"],
    #   ["e[]",      0],
    #   ["e[]",      1],

    #   # *The key here is the order*. In order to be properly interpreted as
    #   # an array of hashes on the server, everything from a single hash must
    #   # come in at once. A duplicate key in an array triggers a new element.
    #   ["f[][foo]", "1"],
    #   ["f[][ghi]", "2"],
    #   ["f[][foo]", "3"],
    #   ["f[][bar]", "4"],
    # ], Stripe.Util.flatten_params(params))
    needs_refactoring_into_elixir()
  end

  test "#symbolize_names should convert names to symbols" do
    # start = %{
    #   "foo" => "bar",
    #   "array" => [{ "foo" => "bar" }],
    #   "nested" => %{
    #     1 => 2,
    #     :symbol => 9,
    #     "string" => nil,
    #   },
    # }
    # finish = %{
    #   foo: "bar",
    #   array: [{ foo: "bar" }],
    #   nested: %{
    #     1 => 2,
    #     :symbol => 9,
    #     :string => nil,
    #   },
    # }

    # symbolized = Stripe.Util.symbolize_names(start)
    # assert_equal(finish, symbolized)
    needs_refactoring_into_elixir()
  end

  test "#normalize_opts should reject nil keys" do
    # assert_raise %{ Stripe.Util.normalize_opts(nil) }
    # assert_raise %{ Stripe.Util.normalize_opts(api_key: nil) }
    needs_refactoring_into_elixir()
  end

  test "#convert_to_stripe_object should pass through unknown types" do
    # obj = Util.convert_to_stripe_object(7, %{})
    # assert_equal 7, obj
    needs_refactoring_into_elixir()
  end

  test "#convert_to_stripe_object should turn hashes into StripeObjects" do
    # obj = Util.convert_to_stripe_object({ foo: "bar" }, %{})
    # assert obj.is_a?(StripeObject)
    # assert_equal "bar", obj.foo
    needs_refactoring_into_elixir()
  end

  test "#convert_to_stripe_object should turn lists into ListObjects" do
    # obj = Util.convert_to_stripe_object({ object: "list" }, %{})
    # assert obj.is_a?(ListObject)
    needs_refactoring_into_elixir()
  end

  test "#convert_to_stripe_object should marshal other classes" do
    # obj = Util.convert_to_stripe_object({ object: "account" }, %{})
    # assert obj.is_a?(Account)
    needs_refactoring_into_elixir()
  end

  test "#convert_to_stripe_object should marshal arrays" do
    # obj = Util.convert_to_stripe_object([1, 2, 3], %{})
    # assert_equal [1, 2, 3], obj
    needs_refactoring_into_elixir()
  end

  test "#array_to_hash should convert an array into a hash with integer keys" do
    # assert_equal({ "0" => 1, "1" => 2, "2" => 3 }, Util.array_to_hash([1, 2, 3]))
    needs_refactoring_into_elixir()
  end

  describe ".request_id_dashboard_url" do
    test "generate a livemode URL" do
      # assert_equal "https://dashboard.stripe.com/live/logs/request-id",
      #               Util.request_id_dashboard_url("request-id", "sk_live_123")
      needs_refactoring_into_elixir()
    end

    test "generate a testmode URL" do
      # assert_equal "https://dashboard.stripe.com/test/logs/request-id",
      #               Util.request_id_dashboard_url("request-id", "sk_test_123")
      needs_refactoring_into_elixir()
    end

    test "default to a testmode URL" do
      # assert_equal "https://dashboard.stripe.com/test/logs/request-id",
      #               Util.request_id_dashboard_url("request-id", nil)
      needs_refactoring_into_elixir()
    end
  end

  describe ".log_*" do
    setup do
      # @old_log_level = Stripe.log_level
      # Stripe.log_level = nil

      # @old_stderr = $stderr
      # $stderr = StringIO.new

      # @old_stdout = $stdout
      # $stdout = StringIO.new
      needs_refactoring_into_elixir()
    end

    # teardown do
    #   Stripe.log_level = @old_log_level
    #   $stderr = @old_stderr
    #   $stdout = @old_stdout
    # end

    describe ".log_debug" do
      test "not log if logging is disabled" do
        # Util.log_debug("foo")
        # assert_equal "", $stdout.string
        needs_refactoring_into_elixir()
      end

      test "log if level set to debug" do
        # Stripe.log_level = Stripe.LEVEL_DEBUG
        # Util.log_debug("foo")
        # assert_equal "message=foo level=debug \n", $stdout.string
        needs_refactoring_into_elixir()
      end

      test "not log if level set to error" do
        # Stripe.log_level = Stripe.LEVEL_ERROR
        # Util.log_debug("foo")
        # assert_equal "", $stdout.string
        needs_refactoring_into_elixir()
      end

      test "not log if level set to info" do
        # Stripe.log_level = Stripe.LEVEL_INFO
        # Util.log_debug("foo")
        # assert_equal "", $stdout.string
        needs_refactoring_into_elixir()
      end
    end

    describe ".log_error" do
      test "not log if logging is disabled" do
        # Util.log_error("foo")
        # assert_equal "", $stdout.string
        needs_refactoring_into_elixir()
      end

      test "log if level set to debug" do
        # Stripe.log_level = Stripe.LEVEL_DEBUG
        # Util.log_error("foo")
        # assert_equal "message=foo level=error \n", $stderr.string
        needs_refactoring_into_elixir()
      end

      test "log if level set to error" do
        # Stripe.log_level = Stripe.LEVEL_ERROR
        # Util.log_error("foo")
        # assert_equal "message=foo level=error \n", $stderr.string
        needs_refactoring_into_elixir()
      end

      test "log if level set to info" do
        # Stripe.log_level = Stripe.LEVEL_INFO
        # Util.log_error("foo")
        # assert_equal "message=foo level=error \n", $stderr.string
        needs_refactoring_into_elixir()
      end
    end

    describe ".log_info" do
      test "not log if logging is disabled" do
        # Util.log_info("foo")
        # assert_equal "", $stdout.string
        needs_refactoring_into_elixir()
      end

      test "log if level set to debug" do
        # Stripe.log_level = Stripe.LEVEL_DEBUG
        # Util.log_info("foo")
        # assert_equal "message=foo level=info \n", $stdout.string
        needs_refactoring_into_elixir()
      end

      test "not log if level set to error" do
        # Stripe.log_level = Stripe.LEVEL_ERROR
        # Util.log_debug("foo")
        # assert_equal "", $stdout.string
        needs_refactoring_into_elixir()
      end

      test "log if level set to info" do
        # Stripe.log_level = Stripe.LEVEL_INFO
        # Util.log_info("foo")
        # assert_equal "message=foo level=info \n", $stdout.string
        needs_refactoring_into_elixir()
      end
    end
  end

  describe ".log_* with a logger" do
    setup do
      # @out = StringIO.new
      # logger = ::Logger.new(@out)

      # # Set a really simple formatter to make matching output as easy as
      # # possible.
      # logger.formatter = proc %{ |_severity, _datetime, _progname, message|
      #   message
      # }

      # Stripe.logger = logger
      needs_refactoring_into_elixir()
    end

    describe ".log_debug" do
      test "log to the logger" do
        # Util.log_debug("foo")
        # assert_equal "message=foo ", @out.string
        needs_refactoring_into_elixir()
      end
    end

    describe ".log_error" do
      test "log to the logger" do
        # Util.log_error("foo")
        # assert_equal "message=foo ", @out.string
        needs_refactoring_into_elixir()
      end
    end

    describe ".log_info" do
      test "log to the logger" do
        # Util.log_info("foo")
        # assert_equal "message=foo ", @out.string
        needs_refactoring_into_elixir()
      end
    end
  end

  describe ".normalize_headers" do
    test "normalize the format of a header key" do
      # assert_equal({ "Request-Id" => nil },
      #               Util.normalize_headers("Request-Id" => nil))
      # assert_equal({ "Request-Id" => nil },
      #               Util.normalize_headers("request-id" => nil))
      # assert_equal({ "Request-Id" => nil },
      #               Util.normalize_headers("Request-ID" => nil))
      # assert_equal({ "Request-Id" => nil },
      #               Util.normalize_headers(request_id: nil))
      needs_refactoring_into_elixir()
    end

    test "tolerate bad formatting" do
      # assert_equal({ "Request-Id" => nil },
      #               Util.normalize_headers("-Request--Id-" => nil))
      # assert_equal({ "Request-Id" => nil },
      #               Util.normalize_headers(request__id: nil))
      needs_refactoring_into_elixir()
    end
  end

  #
  # private
  #
  # I don't feel particularly good about using #send to invoke these, but I
  # want them hidden from the public interface, and each method is far easier
  # to test in isolation (as opposed to going through a public method).
  #

  describe ".colorize" do
    test "colorize for a TTY" do
      # assert_equal "\033[0;32;49mfoo\033[0m",
      #               Util.send(:colorize, "foo", :green, true)
      needs_refactoring_into_elixir()
    end

    test "not colorize otherwise" do
      # assert_equal "foo", Util.send(:colorize, "foo", :green, false)
      needs_refactoring_into_elixir()
    end
  end

  describe ".level_name" do
    test "convert levels to names" do
      # assert_equal "debug", Util.send(:level_name, LEVEL_DEBUG)
      # assert_equal "error", Util.send(:level_name, LEVEL_ERROR)
      # assert_equal "info", Util.send(:level_name, LEVEL_INFO)
      needs_refactoring_into_elixir()
    end
  end

  describe ".log_internal" do
    test "log in a terminal friendly way" do
      # out = StringIO.new

      # # Sketchy as anything, but saves us from pulling in a mocking library.
      # # Open this instance of StringIO, and add a method override so that it
      # # looks like a TTY.
      # out.instance_eval do
      #   def isatty
      #     true
      #   end
      # end

      # Util.send(:log_internal, "message", %{ foo: "bar" },
      #           color: :green, level: Stripe.LEVEL_DEBUG, logger: nil, out: out)
      # assert_equal "\e[0;32;49mDEBU\e[0m message \e[0;32;49mfoo\e[0m=bar\n",
      #               out.string
      needs_refactoring_into_elixir()
    end

    test "log in a data friendly way" do
      # out = StringIO.new
      # Util.send(:log_internal, "message", %{ foo: "bar" },
      #           color: :green, level: Stripe.LEVEL_DEBUG, logger: nil, out: out)
      # assert_equal "message=message level=debug foo=bar\n",
      #               out.string
      needs_refactoring_into_elixir()
    end

    test "log to a logger if set" do
      # out = StringIO.new
      # logger = ::Logger.new(out)

      # # Set a really simple formatter to make matching output as easy as
      # # possible.
      # logger.formatter = proc %{ |_severity, _datetime, _progname, message|
      #   message
      # }

      # Util.send(:log_internal, "message", %{ foo: "bar" },
      #           color: :green, level: Stripe.LEVEL_DEBUG, logger: logger, out: nil)
      # assert_equal "message=message foo=bar",
      #               out.string
      needs_refactoring_into_elixir()
    end
  end

  describe ".wrap_logfmt_value" do
    test "pass through simple values" do
      # assert_equal "abc", Util.send(:wrap_logfmt_value, "abc")
      # assert_equal "123", Util.send(:wrap_logfmt_value, "123")
      # assert_equal "a-b_c/d", Util.send(:wrap_logfmt_value, "a-b_c/d")
      needs_refactoring_into_elixir()
    end

    test "pass through numerics" do
      # assert_equal 123, Util.send(:wrap_logfmt_value, 123)
      # assert_equal 1.23, Util.send(:wrap_logfmt_value, 1.23)
      needs_refactoring_into_elixir()
    end

    test "wrap more complex values in double quotes" do
      # assert_equal %("abc=123"), Util.send(:wrap_logfmt_value, %(abc=123))
      needs_refactoring_into_elixir()
    end

    test "escape double quotes already in the value" do
      # assert_equal %("abc=\\"123\\""), Util.send(:wrap_logfmt_value, %(abc="123"))
      needs_refactoring_into_elixir()
    end

    test "remove newlines" do
      # assert_equal %("abc"), Util.send(:wrap_logfmt_value, "a\nb\nc")
      needs_refactoring_into_elixir()
    end

    test "not error if given a non-string" do
      # assert_equal "true", Util.send(:wrap_logfmt_value, true)
      needs_refactoring_into_elixir()
    end
  end
end
