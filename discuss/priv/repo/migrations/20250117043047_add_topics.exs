defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
      # add :slug, :string
      # add :description, :string
      # add :user_id, references(:users, on_delete: :delete_all)
      # add :category_id, references(:categories, on_delete: :delete_all)

      # timestamps()
    end

  end
end
