defmodule RentalMarketWeb.UserResolverTest do
  use RentalMarketWeb.ConnCase
  alias RentalMarket.Accounts

  def query(conn, querystring) do
    get conn, "/api", [query: querystring]
  end

  @valid_attrs %{email: "some email", name: "some name"}
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Accounts.create_user()

    user
  end

  @query_users """
  {
    users {
      id
      name
      email
    }
  }
  """
  test "query users", %{conn: conn} do
    user_fixture()
    conn = query conn, @query_users
    assert %{ "data" => data } = json_response(conn, 200)
    assert %{ "users" => users } = data
    assert Enum.count(users) == 1
    assert [user] = users
    email = @valid_attrs[:email]
    name = @valid_attrs[:name]
    assert %{
      "id" => _,
      "email" => ^email,
      "name" => ^name
    } = user
  end
end
