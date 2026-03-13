defmodule ChatApp.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatApp.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        visibility: "some visibility"
      })
      |> ChatApp.Projects.create_project()

    project
  end
end
