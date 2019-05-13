defmodule MooseApiWeb.ContactView do
  use MooseApiWeb, :view
  alias MooseApiWeb.ContactView
  alias MooseApiWeb.UserView
  use JaSerializer.PhoenixView


  attributes [:id, :first_name, :last_name, :address_one, :address_two, :city, :state, :zipcode, :contact_number, :website, :email, :user_id]

  has_one(:user, serializer: UserView, identifiers: :always)

  def render("index.json", %{contact: contact}) do
    %{data: render_many(contact, ContactView, "contact.json")}
  end

  def render("show.json", %{contact: contact}) do
    %{data: render_one(contact, ContactView, "contact.json")}
  end

  def render("contact.json", %{contact: contact}) do
    %{id: contact.id,
      first_name: contact.first_name,
      last_name: contact.last_name,
      address_one: contact.address_one,
      address_two: contact.address_two,
      city: contact.city,
      state: contact.state,
      zipcode: contact.zipcode,
      user: contact.user_id,
      contact_number: contact.contact_number,
      website: contact.website,
      email: contact.email}
  end
end
