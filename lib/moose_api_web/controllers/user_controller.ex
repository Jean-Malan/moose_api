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


  def signout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> send_resp(:no_content, "")
  end

  # def signout(conn, %{}) do
  #   token = Guardian.Plug.current_token(conn)
    
  #   # {:ok, claims} = Guardian.revoke(current_user)
  #     Guardian.revoke!(token)
  #   # with {:ok, claims} <- Guardian.revoke(token) do
  #     send_resp(conn, :no_content, "")
  #   # end
  # end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end

# eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJtb29zZV9hcGkiLCJleHAiOjE1NjA3MzcwNjQsImlhdCI6MTU1ODMxNzg2NCwiaXNzIjoibW9vc2VfYXBpIiwianRpIjoiZWUxMzk2MDAtMzU5Mi00ZGM1LTgyZDgtMmRjZmMxNzY1YWEwIiwibmJmIjoxNTU4MzE3ODYzLCJzdWIiOiIyNCIsInR5cCI6ImFjY2VzcyJ9.IPhC7QqU32yRLBBwlBUj3RzrAneZPd6tUpM873owp8verjdk_Yw5-3O9k7tp8fDgy-HCUrZQArbb0vzP7eLwGg