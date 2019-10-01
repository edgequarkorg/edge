defmodule Edge.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :iteration, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:subscriptions, [:user_id])
  end
end
