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

  @doc """
  Generate a project_file.
  """
  def project_file_fixture(attrs \\ %{}) do
    {:ok, project_file} =
      attrs
      |> Enum.into(%{
        content: "some content",
        name: "some name",
        path: "some path",
        type: "some type"
      })
      |> ChatApp.Projects.create_project_file()

    project_file
  end

  @doc """
  Generate a issue.
  """
  def issue_fixture(attrs \\ %{}) do
    {:ok, issue} =
      attrs
      |> Enum.into(%{
        description: "some description",
        status: "some status",
        title: "some title"
      })
      |> ChatApp.Projects.create_issue()

    issue
  end
end
