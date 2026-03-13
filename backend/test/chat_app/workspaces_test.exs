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

  describe "boards" do
    alias ChatApp.Workspaces.Board

    import ChatApp.WorkspacesFixtures

    @invalid_attrs %{name: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Workspaces.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Workspaces.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Board{} = board} = Workspaces.create_board(valid_attrs)
      assert board.name == "some name"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspaces.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Board{} = board} = Workspaces.update_board(board, update_attrs)
      assert board.name == "some updated name"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspaces.update_board(board, @invalid_attrs)
      assert board == Workspaces.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Workspaces.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Workspaces.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Workspaces.change_board(board)
    end
  end

  describe "tasks" do
    alias ChatApp.Workspaces.Task

    import ChatApp.WorkspacesFixtures

    @invalid_attrs %{description: nil, order: nil, status: nil, title: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Workspaces.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Workspaces.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description", order: 42, status: "some status", title: "some title"}

      assert {:ok, %Task{} = task} = Workspaces.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.order == 42
      assert task.status == "some status"
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspaces.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description", order: 43, status: "some updated status", title: "some updated title"}

      assert {:ok, %Task{} = task} = Workspaces.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.order == 43
      assert task.status == "some updated status"
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspaces.update_task(task, @invalid_attrs)
      assert task == Workspaces.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Workspaces.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Workspaces.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Workspaces.change_task(task)
    end
  end
end
