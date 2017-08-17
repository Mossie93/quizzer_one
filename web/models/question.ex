defmodule QuizzerOne.Question do
  use QuizzerOne.Web, :model
  use Arc.Ecto.Schema

  schema "questions" do
    field :question_text, :string
    field :image, QuizzerOne.Image.Type

    belongs_to :quiz_template, QuizzerOne.QuizTemplate

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question_text, :image])
    |> validate_required([:question_text])
    |> check_uuid
    |> cast_attachments(params, [:image])
  end

  defp check_uuid(changeset) do
    if get_field(changeset, :uuid) == nil do
      force_change(changeset, :uuid, UUID.uuid1)
    else
      changeset
    end
  end
end
