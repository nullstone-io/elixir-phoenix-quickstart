defmodule ElixirPhoenixQuickstartWeb.PageController do
  use ElixirPhoenixQuickstartWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
