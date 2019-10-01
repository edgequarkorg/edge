defmodule EdgeWeb.PageController do
  use EdgeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
