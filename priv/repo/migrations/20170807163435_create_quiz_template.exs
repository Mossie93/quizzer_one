defmodule QuizzerOne.Repo.Migrations.CreateQuizTemplate do
  use Ecto.Migration

  def change do
    create table(:quiz_templates) do
      add :name, :string

      timestamps()
    end

  end
end
