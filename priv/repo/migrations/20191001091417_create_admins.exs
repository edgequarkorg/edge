defmodule Edge.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :email, :string
      add :hashed_password, :string

      timestamps()
    end

  end
end
