defmodule MooseApiWeb.CompanyController do
  use MooseApiWeb, :controller

  alias MooseApi.Companies
  alias MooseApi.Companies.Company

  action_fallback MooseApiWeb.FallbackController

  # field :user_id, :id
  # field :tag, :string
  # field :name, :string
  # field :description, :string

  def index(conn, _params) do
    text conn, "Hello"
    company = Companies.list_company()
    render(conn, "index.json", company: company)
  end

  def create(conn, %{"type" => "company", "data" => data = %{"attributes" => company_params}}) do
    with {:ok, %Company{} = company} <- Companies.create_company(company_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", company_path(conn, :show, company))
      |> render("show.json", company: company)
    end
  end

  def show(conn, %{"id" => id}) do
    company = Companies.get_company!(id)
    render(conn, "show.json", company: company)
  end

  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Companies.get_company!(id)

    with {:ok, %Company{} = company} <- Companies.update_company(company, company_params) do
      render(conn, "show.json", company: company)
    end
  end

  def delete(conn, %{"id" => id}) do
    company = Companies.get_company!(id)
    with {:ok, %Company{}} <- Companies.delete_company(company) do
      send_resp(conn, :no_content, "")
    end
  end
end
