defmodule Nativo.PageController do
  use Nativo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
