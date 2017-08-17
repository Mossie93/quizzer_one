defmodule QuizzerOne.AnswerTest do
  use QuizzerOne.ModelCase

  alias QuizzerOne.Answer

  @valid_attrs %{answer_text: "some content", correct: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Answer.changeset(%Answer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Answer.changeset(%Answer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
