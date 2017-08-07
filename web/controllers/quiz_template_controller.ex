defmodule QuizzerOne.QuizTemplateController do
  use QuizzerOne.Web, :controller

  alias QuizzerOne.QuizTemplate

  def index(conn, _params) do
    quiz_templates = Repo.all(QuizTemplate)
    render(conn, "index.html", quiz_templates: quiz_templates)
  end

  def new(conn, _params) do
    changeset = QuizTemplate.changeset(%QuizTemplate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quiz_template" => quiz_template_params}) do
    changeset = QuizTemplate.changeset(%QuizTemplate{}, quiz_template_params)

    case Repo.insert(changeset) do
      {:ok, _quiz_template} ->
        conn
        |> put_flash(:info, "Quiz template created successfully.")
        |> redirect(to: quiz_template_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quiz_template = Repo.get!(QuizTemplate, id)
    render(conn, "show.html", quiz_template: quiz_template)
  end

  def edit(conn, %{"id" => id}) do
    quiz_template = Repo.get!(QuizTemplate, id)
    changeset = QuizTemplate.changeset(quiz_template)
    render(conn, "edit.html", quiz_template: quiz_template, changeset: changeset)
  end

  def update(conn, %{"id" => id, "quiz_template" => quiz_template_params}) do
    quiz_template = Repo.get!(QuizTemplate, id)
    changeset = QuizTemplate.changeset(quiz_template, quiz_template_params)

    case Repo.update(changeset) do
      {:ok, quiz_template} ->
        conn
        |> put_flash(:info, "Quiz template updated successfully.")
        |> redirect(to: quiz_template_path(conn, :show, quiz_template))
      {:error, changeset} ->
        render(conn, "edit.html", quiz_template: quiz_template, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    quiz_template = Repo.get!(QuizTemplate, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(quiz_template)

    conn
    |> put_flash(:info, "Quiz template deleted successfully.")
    |> redirect(to: quiz_template_path(conn, :index))
  end
end
