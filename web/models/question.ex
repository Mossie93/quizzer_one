defmodule QuizzerOne.Question do
  use QuizzerOne.Web, :model

  schema "questions" do
    field :question_text, :string
    field :image, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question_text, :image])
    |> validate_required([:question_text, :image])
  end
end
