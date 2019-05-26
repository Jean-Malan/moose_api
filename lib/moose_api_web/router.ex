defmodule MooseApiWeb.Router do
  use MooseApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json", "json-api"]
  end

  pipeline :auth do
    plug MooseApiWeb.Auth.Pipeline
  end

  scope "/api", MooseApiWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    options "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
    options "/users/signin", UserController, :signin
  end

  scope "/api", MooseApiWeb do
    pipe_through [:api, :auth]
    options "/users/logout", UserController, :signout
    post "/users/signout", UserController, :signout
    options "/users/signout", UserController, :signout
    resources "/company", CompanyController, except: [:new, :edit]
    resources "/product", ProductController, except: [:new, :edit]
    resources "/contact", ContactController, except: [:new, :edit]
    options "/contact", ContactController, except: [:new, :edit]
    post "/contact", ContactController, :create
    patch "/contact", ContactController, :update
    delete "/contact", ContactController, :delete
    resources "/bank_account", BankAccountController, except: [:new, :edit]
    post "/gl_accounts", GlAccountController, :create
    patch "/gl_accounts", GlAccountController, :update
    delete "/gl_accounts", GlAccountController, :delete
    get "/gl_accounts", GlAccountController, :index
    options "/gl_accounts", GlAccountController, except: [:new, :edit]
    resources "/gl_account", GlAccountController, except: [:new, :edit]
    resources "/sales_invoice", SalesInvoiceController, except: [:new, :edit]
    delete "/sales_invoice", SalesInvoiceController, :delete
    options "/sales_invoice", SalesInvoiceController, except: [:new, :edit]
    resources "/sales_entries", SalesEntriesController, except: [:new, :edit]
    options "/sales_entries", SalesEntriesController, except: [:new, :edit]
    resources "/purchase_invoice", PurchaseInvoiceController, except: [:new, :edit]
    resources "/purchases_entries", PurchaseEntriesController, except: [:new, :edit]
    resources "/general_journal", GeneralJournalController, except: [:new, :edit]
    resources "/general_journal_entries", GeneralJournalEntriesController, except: [:new, :edit]
    resources "/credit_note", CreditNoteController, except: [:new, :edit]
    resources "/credit_note_entries", CreditNoteEntriesController, except: [:new, :edit]
    resources "/financial_transactions", FinancialTransactionController, except: [:new, :edit]
    options "/financial_transactions", FinancialTransactionController, except: [:new, :edit]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", MooseApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end