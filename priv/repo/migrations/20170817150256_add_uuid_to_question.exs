defmodule QuizzerOne.Repo.Migrations.AddUuidToQuestion do
  use Ecto.Migration

  def change do
    alter table(:questions) do
      add :uuid, :string
    end
  end
end
