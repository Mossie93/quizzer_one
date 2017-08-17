defmodule QuizzerOne.Repo.Migrations.AddQuizTemplateIdToQuestion do
  use Ecto.Migration

  def change do
    alter table(:questions) do
      add :quiz_template_id, references(:quiz_templates, on_delete: :nothing)
    end
    create index(:questions, [:quiz_template_id])
  end
end
