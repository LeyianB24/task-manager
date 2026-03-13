defmodule ChatApp.ProjectsTest do
  use ChatApp.DataCase

  alias ChatApp.Projects

  describe "projects" do
    alias ChatApp.Projects.Project

    import ChatApp.ProjectsFixtures

    @invalid_attrs %{description: nil, name: nil, visibility: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", name: "some name", visibility: "some visibility"}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.name == "some name"
      assert project.visibility == "some visibility"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", visibility: "some updated visibility"}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.name == "some updated name"
      assert project.visibility == "some updated visibility"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "project_files" do
    alias ChatApp.Projects.ProjectFile

    import ChatApp.ProjectsFixtures

    @invalid_attrs %{content: nil, name: nil, path: nil, type: nil}

    test "list_project_files/0 returns all project_files" do
      project_file = project_file_fixture()
      assert Projects.list_project_files() == [project_file]
    end

    test "get_project_file!/1 returns the project_file with given id" do
      project_file = project_file_fixture()
      assert Projects.get_project_file!(project_file.id) == project_file
    end

    test "create_project_file/1 with valid data creates a project_file" do
      valid_attrs = %{content: "some content", name: "some name", path: "some path", type: "some type"}

      assert {:ok, %ProjectFile{} = project_file} = Projects.create_project_file(valid_attrs)
      assert project_file.content == "some content"
      assert project_file.name == "some name"
      assert project_file.path == "some path"
      assert project_file.type == "some type"
    end

    test "create_project_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project_file(@invalid_attrs)
    end

    test "update_project_file/2 with valid data updates the project_file" do
      project_file = project_file_fixture()
      update_attrs = %{content: "some updated content", name: "some updated name", path: "some updated path", type: "some updated type"}

      assert {:ok, %ProjectFile{} = project_file} = Projects.update_project_file(project_file, update_attrs)
      assert project_file.content == "some updated content"
      assert project_file.name == "some updated name"
      assert project_file.path == "some updated path"
      assert project_file.type == "some updated type"
    end

    test "update_project_file/2 with invalid data returns error changeset" do
      project_file = project_file_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project_file(project_file, @invalid_attrs)
      assert project_file == Projects.get_project_file!(project_file.id)
    end

    test "delete_project_file/1 deletes the project_file" do
      project_file = project_file_fixture()
      assert {:ok, %ProjectFile{}} = Projects.delete_project_file(project_file)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project_file!(project_file.id) end
    end

    test "change_project_file/1 returns a project_file changeset" do
      project_file = project_file_fixture()
      assert %Ecto.Changeset{} = Projects.change_project_file(project_file)
    end
  end

  describe "issues" do
    alias ChatApp.Projects.Issue

    import ChatApp.ProjectsFixtures

    @invalid_attrs %{description: nil, status: nil, title: nil}

    test "list_issues/0 returns all issues" do
      issue = issue_fixture()
      assert Projects.list_issues() == [issue]
    end

    test "get_issue!/1 returns the issue with given id" do
      issue = issue_fixture()
      assert Projects.get_issue!(issue.id) == issue
    end

    test "create_issue/1 with valid data creates a issue" do
      valid_attrs = %{description: "some description", status: "some status", title: "some title"}

      assert {:ok, %Issue{} = issue} = Projects.create_issue(valid_attrs)
      assert issue.description == "some description"
      assert issue.status == "some status"
      assert issue.title == "some title"
    end

    test "create_issue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_issue(@invalid_attrs)
    end

    test "update_issue/2 with valid data updates the issue" do
      issue = issue_fixture()
      update_attrs = %{description: "some updated description", status: "some updated status", title: "some updated title"}

      assert {:ok, %Issue{} = issue} = Projects.update_issue(issue, update_attrs)
      assert issue.description == "some updated description"
      assert issue.status == "some updated status"
      assert issue.title == "some updated title"
    end

    test "update_issue/2 with invalid data returns error changeset" do
      issue = issue_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_issue(issue, @invalid_attrs)
      assert issue == Projects.get_issue!(issue.id)
    end

    test "delete_issue/1 deletes the issue" do
      issue = issue_fixture()
      assert {:ok, %Issue{}} = Projects.delete_issue(issue)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_issue!(issue.id) end
    end

    test "change_issue/1 returns a issue changeset" do
      issue = issue_fixture()
      assert %Ecto.Changeset{} = Projects.change_issue(issue)
    end
  end
end
