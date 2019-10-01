defmodule Edge.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :last_seen, :utc_datetime

      timestamps()
    end

  end
end
