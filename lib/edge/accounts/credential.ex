defmodule Edge.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credentials" do
    field :password_hash, :string
    field :reset_token, :string
    field :reset_token_created, :utc_datetime
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:reset_token, :reset_token_created, :password_hash])
    |> validate_required([:reset_token, :reset_token_created, :password_hash])
  end
end
