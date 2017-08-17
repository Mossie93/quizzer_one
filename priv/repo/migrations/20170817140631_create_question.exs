defmodule QuizzerOne.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question_text, :text
      add :image, :string

      timestamps()
    end

  end
end
