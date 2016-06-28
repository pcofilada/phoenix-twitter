defmodule PhoenixTwitter.PageController do
  use PhoenixTwitter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
