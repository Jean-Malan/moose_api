defmodule MooseApiWeb.GlAccountController do
  use MooseApiWeb, :controller

  alias MooseApi.Account
  alias MooseApi.Account.GlAccount

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    gl_account = Account.list_gl_account()
    render(conn, "index.json", gl_account: gl_account)
  end

  def create(conn, %{"gl_account" => gl_account_params}) do
    with {:ok, %GlAccount{} = gl_account} <- Account.create_gl_account(gl_account_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", gl_account_path(conn, :show, gl_account))
      |> render("show.json", gl_account: gl_account)
    end
  end

  def show(conn, %{"id" => id}) do
    gl_account = Account.get_gl_account!(id)
    render(conn, "show.json", gl_account: gl_account)
  end

  def update(conn, %{"id" => id, "gl_account" => gl_account_params}) do
    gl_account = Account.get_gl_account!(id)

    with {:ok, %GlAccount{} = gl_account} <- Account.update_gl_account(gl_account, gl_account_params) do
      render(conn, "show.json", gl_account: gl_account)
    end
  end

  def delete(conn, %{"id" => id}) do
    gl_account = Account.get_gl_account!(id)
    with {:ok, %GlAccount{}} <- Account.delete_gl_account(gl_account) do
      send_resp(conn, :no_content, "")
    end
  end
end
