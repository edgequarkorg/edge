defmodule Edge.Bets.Bet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bets" do
    field :a_b, :string
    field :bet, :decimal
    field :country, :string
    field :event, :string
    field :odd, :decimal
    field :p_l, :decimal
    field :stake, :decimal
    field :admin_id, :id

    timestamps()
  end

  @doc false
  def changeset(bet, attrs) do
    bet
    |> cast(attrs, [:country, :a_b, :event, :bet, :stake, :odd, :p_l])
    |> validate_required([:country, :a_b, :event, :bet, :stake, :odd, :p_l])
  end
end
