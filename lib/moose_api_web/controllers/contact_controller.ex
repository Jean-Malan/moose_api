defmodule MooseApiWeb.ContactController do
  use MooseApiWeb, :controller

  alias MooseApi.Contacts
  alias MooseApi.Contacts.Contact
  alias MooseApiWeb.Auth.Guardian
  alias MooseApi.Repo

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    contact = Guardian.Plug.current_resource(conn)
    IO.inspect(Guardian.Plug.current_resource(conn))
    # id = contact.id
    IO.inspect(contact.id)
    contact_list = Contacts.list_contact(contact.id)
    IO.inspect("PPPLLLLLLLLLEEEEEEASE")
    IO.inspect(contact_list)
    |> Repo.preload(:user)

    render(conn, "index.json", data: contact_list)
  end
  

  def create(conn, %{"type" => "contacts", "data" => data = %{"attributes" => contact_params}}) do
    with {:ok, %Contact{} = contact} <- Contacts.create_contact(contact_params) do
      contact =  contact.id
      |> Contacts.get_contact!
      |> Repo.preload(:user)

      conn
      |> put_status(:created)
      |> put_resp_header("location", contact_path(conn, :show, contact))
      |> render("show.json", contact: contact)
    end
  end

  def show(conn, %{"id" => id}) do
    contact = Contacts.get_contact!(id)
    |> Repo.preload(:user)

    render(conn, "show.json", data: contact)
  end

  def update(conn, %{"id" => id, "contact" => contact_params}) do
    contact = Contacts.get_contact!(id)

    with {:ok, %Contact{} = contact} <- Contacts.update_contact(contact, contact_params) do
      render(conn, "show.json", contact: contact)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact = Contacts.get_contact!(id)
    with {:ok, %Contact{}} <- Contacts.delete_contact(contact) do
      send_resp(conn, :no_content, "")
    end
  end
end
