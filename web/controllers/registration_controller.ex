defmodule PhoenixTwitter.RegistrationController do
  use PhoenixTwitter.Web, :controller
  alias PhoenixTwitter.User

  plug :scrub_params, "user" when action in [:create]
  
  def new(conn, _params) do
    changeset = User.changeset(%User{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case PhoenixTwitter.Registration.create(changeset, PhoenixTwitter.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Account created")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
