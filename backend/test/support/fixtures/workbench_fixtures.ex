defmodule ChatApp.WorkbenchFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatApp.Workbench` context.
  """

  @doc """
  Generate a saved_request.
  """
  def saved_request_fixture(attrs \\ %{}) do
    {:ok, saved_request} =
      attrs
      |> Enum.into(%{
        body: "some body",
        headers: %{},
        method: "some method",
        name: "some name",
        url: "some url"
      })
      |> ChatApp.Workbench.create_saved_request()

    saved_request
  end
end
