defmodule MooseApi.ContactsTest do
  use MooseApi.DataCase

  alias MooseApi.Contacts

  describe "contact" do
    alias MooseApi.Contacts.Contact

    @valid_attrs %{address_one: "some address_one", address_two: "some address_two", city: "some city", contact_number: "some contact_number", email: "some email", first_name: "some first_name", last_name: "some last_name", state: "some state", website: "some website", zipcode: "some zipcode"}
    @update_attrs %{address_one: "some updated address_one", address_two: "some updated address_two", city: "some updated city", contact_number: "some updated contact_number", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", state: "some updated state", website: "some updated website", zipcode: "some updated zipcode"}
    @invalid_attrs %{address_one: nil, address_two: nil, city: nil, contact_number: nil, email: nil, first_name: nil, last_name: nil, state: nil, website: nil, zipcode: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_contact()

      contact
    end

    test "list_contact/0 returns all contact" do
      contact = contact_fixture()
      assert Contacts.list_contact() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Contacts.create_contact(@valid_attrs)
      assert contact.address_one == "some address_one"
      assert contact.address_two == "some address_two"
      assert contact.city == "some city"
      assert contact.contact_number == "some contact_number"
      assert contact.email == "some email"
      assert contact.first_name == "some first_name"
      assert contact.last_name == "some last_name"
      assert contact.state == "some state"
      assert contact.website == "some website"
      assert contact.zipcode == "some zipcode"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, contact} = Contacts.update_contact(contact, @update_attrs)
      assert %Contact{} = contact
      assert contact.address_one == "some updated address_one"
      assert contact.address_two == "some updated address_two"
      assert contact.city == "some updated city"
      assert contact.contact_number == "some updated contact_number"
      assert contact.email == "some updated email"
      assert contact.first_name == "some updated first_name"
      assert contact.last_name == "some updated last_name"
      assert contact.state == "some updated state"
      assert contact.website == "some updated website"
      assert contact.zipcode == "some updated zipcode"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact(contact, @invalid_attrs)
      assert contact == Contacts.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end
end
