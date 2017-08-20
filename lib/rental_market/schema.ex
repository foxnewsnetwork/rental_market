defmodule RentalMarket.Schema do
  use Absinthe.Schema
  
  @desc """
  An user is collection of data in our database that
  contains credentials for user authentication and app
  interaction
  """
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  query do
    field :users, list_of(:user) do
      resolve &RentalMarketWeb.UserResolver.all/2
    end
  end

end