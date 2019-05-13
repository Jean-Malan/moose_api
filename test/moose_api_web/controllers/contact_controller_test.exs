defmodule MooseApiWeb.ContactControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Contacts
  alias MooseApi.Contacts.Contact

  @create_attrs %{address_one: "some address_one", address_two: "some address_two", city: "some city", contact_number: "some contact_number", email: "some email", first_name: "some first_name", last_name: "some last_name", state: "some state", website: "some website", zipcode: "some zipcode"}
  @update_attrs %{address_one: "some updated address_one", address_two: "some updated address_two", city: "some updated city", contact_number: "some updated contact_number", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", state: "some updated state", website: "some updated website", zipcode: "some updated zipcode"}
  @invalid_attrs %{address_one: nil, address_two: nil, city: nil, contact_number: nil, email: nil, first_name: nil, last_name: nil, state: nil, website: nil, zipcode: nil}

  def fixture(:contact) do
    {:ok, contact} = Contacts.create_contact(@create_attrs)
    contact
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contact", %{conn: conn} do
      conn = get conn, contact_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create contact" do
    test "renders contact when data is valid", %{conn: conn} do
      conn = post conn, contact_path(conn, :create), contact: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, contact_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address_one" => "some address_one",
        "address_two" => "some address_two",
        "city" => "some city",
        "contact_number" => "some contact_number",
        "email" => "some email",
        "first_name" => "some first_name",
        "last_name" => "some last_name",
        "state" => "some state",
        "website" => "some website",
        "zipcode" => "some zipcode"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, contact_path(conn, :create), contact: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update contact" do
    setup [:create_contact]

    test "renders contact when data is valid", %{conn: conn, contact: %Contact{id: id} = contact} do
      conn = put conn, contact_path(conn, :update, contact), contact: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, contact_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address_one" => "some updated address_one",
        "address_two" => "some updated address_two",
        "city" => "some updated city",
        "contact_number" => "some updated contact_number",
        "email" => "some updated email",
        "first_name" => "some updated first_name",
        "last_name" => "some updated last_name",
        "state" => "some updated state",
        "website" => "some updated website",
        "zipcode" => "some updated zipcode"}
    end

    test "renders errors when data is invalid", %{conn: conn, contact: contact} do
      conn = put conn, contact_path(conn, :update, contact), contact: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete contact" do
    setup [:create_contact]

    test "deletes chosen contact", %{conn: conn, contact: contact} do
      conn = delete conn, contact_path(conn, :delete, contact)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, contact_path(conn, :show, contact)
      end
    end
  end

  defp create_contact(_) do
    contact = fixture(:contact)
    {:ok, contact: contact}
  end
end
