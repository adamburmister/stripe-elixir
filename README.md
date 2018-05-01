# stripe-elixir

An Elixir SDK for Stripe

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `stripe` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stripe, "~> 0.1.0"}
  ]
end
```

## TODO List

* [x] Import unit tests from stripe-ruby
* [x] Add mix deps for Poison (JSON parser)
* [ ] Remove nested `decide` blocks from unit tests (see https://hexdocs.pm/ex_unit/ExUnit.Case.html)
* [ ] Migrate unit tests from stripe-ruby into Elixirisms
* [ ] Set up base modules, delegators, implementation
