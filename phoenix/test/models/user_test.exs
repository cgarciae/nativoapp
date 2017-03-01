defmodule Nativo.UserTest do
  use Nativo.ModelCase

  alias Nativo.User

  @valid_attrs %{email: "some content", name: "some content", token: "some content", user_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
