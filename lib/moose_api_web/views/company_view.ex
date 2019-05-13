defmodule MooseApiWeb.CompanyView do
  use MooseApiWeb, :view
  alias MooseApiWeb.CompanyView

  
  def render("index.json", %{company: company}) do
    %{data: render_many(company, CompanyView, "company.json")}
  end

  def render("show.json", %{company: company}) do
    %{data: render_one(company, CompanyView, "company.json")}
  end

  def render("company.json", %{company: company}) do
    %{id: company.id, name: company.name, description: company.description}
  end
end
