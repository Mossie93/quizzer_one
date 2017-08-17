defmodule QuizzerOne.QuizTemplate do
  use QuizzerOne.Web, :model
  use Arc.Ecto.Schema

  schema "quiz_templates" do
    field :name, :string
    field :image, QuizzerOne.Image.Type
    field :uuid, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
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
