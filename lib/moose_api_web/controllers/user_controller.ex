defmodule MooseApiWeb.UserController do
  use MooseApiWeb, :controller

  alias MooseApi.Accounts
  alias MooseApi.Accounts.User
  alias MooseApiWeb.Auth.Guardian

  action_fallback MooseApiWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    IO.inspect(Guardian.authenticate(email, password))
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def signout(conn, %{}) do
    current_user = Guardian.Plug.current_token(conn)
    # {:ok, claims} = Guardian.revoke(current_user)
    IO.inspect(current_user)
    with Guardian.revoke(current_user) do
      send_resp(conn, :no_content, "")
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
