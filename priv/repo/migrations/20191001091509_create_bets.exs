defmodule Edge.Repo.Migrations.CreateBets do
  use Ecto.Migration

  def change do
    create table(:bets) do
      add :country, :string
      add :a_b, :string
      add :event, :string
      add :bet, :decimal
      add :stake, :decimal
      add :odd, :decimal
      add :p_l, :decimal
      add :admin_id, references(:admins, on_delete: :nothing)

      timestamps()
    end

    create index(:bets, [:admin_id])
  end
end
