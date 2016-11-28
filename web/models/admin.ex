defmodule FlamingPlanet.Admin do
  use FlamingPlanet.Web, :model

  schema "admins" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
  end
end
