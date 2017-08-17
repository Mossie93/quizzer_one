defmodule QuizzerOne.Repo.Migrations.AddUuidToQuizTemplate do
  use Ecto.Migration

  def change do
    alter table(:quiz_templates) do
      add :uuid, :string
    end
  end
end
