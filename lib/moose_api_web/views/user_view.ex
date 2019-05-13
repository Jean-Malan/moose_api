defmodule MooseApiWeb.UserView do
  use MooseApiWeb, :view
  alias MooseApiWeb.UserView
  use JaSerializer.PhoenixView

    attributes [:id, :email]
    has_many(:contact, serializer: ContactView)
  
  def render("user.json", %{user: user, token: token}) do
    %{
      email: user.email,
      token: token
    }
end

end
