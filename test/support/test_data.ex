ExUnit.start()

defmodule StripeTest.TestData do
  use ExUnit.Case

  def make_invalid_exp_year_error() do
    %{
      error: %{
        code: "invalid_expiry_year",
        param: "exp_year",
        type: "card_error",
        message: "Your card's expiration year is invalid"
      }
    }
  end

  def make_missing_id_error() do
    %{
      error: %{
        param: "id",
        type: "invalid_request_error",
        message: "Missing id"
      }
    }
  end

  def make_rate_limit_error() do
    %{
      error: %{
        type: "invalid_request_error",
        message: "Too many requests in a period of time."
      }
    }
  end
end
