defmodule QuizzerOne.QuizTemplate do
  use QuizzerOne.Web, :model

  schema "quiz_templates" do
    field :name, :string
    field :image, QuizzerOne.Image.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :image])
    |> validate_required([:name, :image])
  end
end
