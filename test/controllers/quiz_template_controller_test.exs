defmodule QuizzerOne.QuizTemplateControllerTest do
  use QuizzerOne.ConnCase

  alias QuizzerOne.QuizTemplate
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, quiz_template_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing quiz templates"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, quiz_template_path(conn, :new)
    assert html_response(conn, 200) =~ "New quiz template"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, quiz_template_path(conn, :create), quiz_template: @valid_attrs
    assert redirected_to(conn) == quiz_template_path(conn, :index)
    assert Repo.get_by(QuizTemplate, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, quiz_template_path(conn, :create), quiz_template: @invalid_attrs
    assert html_response(conn, 200) =~ "New quiz template"
  end

  test "shows chosen resource", %{conn: conn} do
    quiz_template = Repo.insert! %QuizTemplate{}
    conn = get conn, quiz_template_path(conn, :show, quiz_template)
    assert html_response(conn, 200) =~ "Show quiz template"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, quiz_template_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    quiz_template = Repo.insert! %QuizTemplate{}
    conn = get conn, quiz_template_path(conn, :edit, quiz_template)
    assert html_response(conn, 200) =~ "Edit quiz template"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    quiz_template = Repo.insert! %QuizTemplate{}
    conn = put conn, quiz_template_path(conn, :update, quiz_template), quiz_template: @valid_attrs
    assert redirected_to(conn) == quiz_template_path(conn, :show, quiz_template)
    assert Repo.get_by(QuizTemplate, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    quiz_template = Repo.insert! %QuizTemplate{}
    conn = put conn, quiz_template_path(conn, :update, quiz_template), quiz_template: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit quiz template"
  end

  test "deletes chosen resource", %{conn: conn} do
    quiz_template = Repo.insert! %QuizTemplate{}
    conn = delete conn, quiz_template_path(conn, :delete, quiz_template)
    assert redirected_to(conn) == quiz_template_path(conn, :index)
    refute Repo.get(QuizTemplate, quiz_template.id)
  end
end
