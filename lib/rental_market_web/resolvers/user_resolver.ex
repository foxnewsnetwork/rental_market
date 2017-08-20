defmodule RentalMarketWeb.UserResolver do
  def all(_args, _info) do
    {:ok, RentalMarket.Accounts.list_users}
  end
end