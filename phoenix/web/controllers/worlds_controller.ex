defmodule Nativo.WorldsController do
  use Nativo.Web, :controller

  def get(conn, %{"id" => id}) do
    file_path = "/data/nativo/#{id}.json"

    resp = with {:ok, text} <- File.read(file_path) do
      Poison.decode(text)
    end

    case resp do
      {:ok, world} ->
        json conn, %{
          "data" => %{
            "world" => world
          }
        }

      {:error, reason} ->
        json conn, %{"error" => reason}
    end
  end

  def upsert(conn, %{"id" => id, "world" => world}) do
    file_path = "/data/nativo/#{id}.json"

    resp = with {:ok, world} <- Poison.encode(world) do
      File.write(file_path, world)
    end

    case resp do
      :ok ->
        json conn, %{"data" => "ok"}

      {:error, reason} ->
        json conn, %{"error" => reason}
    end
  end
end

