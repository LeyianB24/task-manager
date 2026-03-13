defmodule ChatApp.WorkspacesTest do
  use ChatApp.DataCase

  alias ChatApp.Workspaces

  describe "workspaces" do
    alias ChatApp.Workspaces.Workspace

    import ChatApp.WorkspacesFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_workspaces/0 returns all workspaces" do
      workspace = workspace_fixture()
      assert Workspaces.list_workspaces() == [workspace]
    end

    test "get_workspace!/1 returns the workspace with given id" do
      workspace = workspace_fixture()
      assert Workspaces.get_workspace!(workspace.id) == workspace
    end

    test "create_workspace/1 with valid data creates a workspace" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Workspace{} = workspace} = Workspaces.create_workspace(valid_attrs)
      assert workspace.description == "some description"
      assert workspace.name == "some name"
    end

    test "create_workspace/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspaces.create_workspace(@invalid_attrs)
    end

    test "update_workspace/2 with valid data updates the workspace" do
      workspace = workspace_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Workspace{} = workspace} = Workspaces.update_workspace(workspace, update_attrs)
      assert workspace.description == "some updated description"
      assert workspace.name == "some updated name"
    end

    test "update_workspace/2 with invalid data returns error changeset" do
      workspace = workspace_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspaces.update_workspace(workspace, @invalid_attrs)
      assert workspace == Workspaces.get_workspace!(workspace.id)
    end

    test "delete_workspace/1 deletes the workspace" do
      workspace = workspace_fixture()
      assert {:ok, %Workspace{}} = Workspaces.delete_workspace(workspace)
      assert_raise Ecto.NoResultsError, fn -> Workspaces.get_workspace!(workspace.id) end
    end

    test "change_workspace/1 returns a workspace changeset" do
      workspace = workspace_fixture()
      assert %Ecto.Changeset{} = Workspaces.change_workspace(workspace)
    end
  end
end
