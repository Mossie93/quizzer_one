defmodule QuizzerOne.Answer do
  use QuizzerOne.Web, :model

  schema "answers" do
    field :answer_text, :string
    field :correct, :boolean, default: false
    belongs_to :question, QuizzerOne.Question

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:answer_text, :correct])
    |> validate_required([:answer_text, :correct])
  end
end
