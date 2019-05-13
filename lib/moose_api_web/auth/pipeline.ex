defmodule MooseApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :moose_api,
    module: MooseApiWeb.Auth.Guardian,
    error_handler: MooseApiWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end