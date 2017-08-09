defmodule QuizzerOne.Repo.Migrations.AddImageToQuizTemplate do
  use Ecto.Migration

  def change do
    alter table(:quiz_templates) do
      add :image, :string
    end
  end
end
