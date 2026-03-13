defmodule ChatApp.WorkspacesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatApp.Workspaces` context.
  """

  @doc """
  Generate a workspace.
  """
  def workspace_fixture(attrs \\ %{}) do
    {:ok, workspace} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> ChatApp.Workspaces.create_workspace()

    workspace
  end

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ChatApp.Workspaces.create_board()

    board
  end
end
