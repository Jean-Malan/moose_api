defmodule MooseApiWeb.GlAccountView do
  use MooseApiWeb, :view
  alias MooseApiWeb.GlAccountView

  def render("index.json", %{gl_account: gl_account}) do
    %{data: render_many(gl_account, GlAccountView, "gl_account.json")}
  end

  def render("show.json", %{gl_account: gl_account}) do
    %{data: render_one(gl_account, GlAccountView, "gl_account.json")}
  end

  def render("gl_account.json", %{gl_account: gl_account}) do
    %{id: gl_account.id,
      title: gl_account.title,
      account_code: gl_account.account_code,
      user_id: gl_account.user_id,
      account_type: gl_account.account_type}
  end
end
