defmodule MooseApiWeb.UserView do
  use MooseApiWeb, :view
  alias MooseApiWeb.UserView
  alias MooseApiWeb.SalesInvoiceView
  use JaSerializer.PhoenixView

    attributes [:id, :email]
    has_many(:contact, serializer: ContactView)
    has_many(:sales_invoice,serializer: SalesInvoiceView)
  
  def render("user.json", %{user: user, token: token}) do
    %{
      email: user.email,
      token: token
    }
end

end
