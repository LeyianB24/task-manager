defmodule ChatApp.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias ChatApp.Repo

  alias ChatApp.Projects.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  def list_user_projects(user_id) do
    Project
    |> where(user_id: ^user_id)
    |> Repo.all()
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias ChatApp.Projects.ProjectFile

  @doc """
  Returns the list of project_files.

  ## Examples

      iex> list_project_files()
      [%ProjectFile{}, ...]

  """
  def list_project_files do
    Repo.all(ProjectFile)
  end

  def list_project_files(project_id) do
    ProjectFile
    |> where(project_id: ^project_id)
    |> Repo.all()
  end

  @doc """
  Gets a single project_file.

  Raises `Ecto.NoResultsError` if the Project file does not exist.

  ## Examples

      iex> get_project_file!(123)
      %ProjectFile{}

      iex> get_project_file!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_file!(id), do: Repo.get!(ProjectFile, id)

  @doc """
  Creates a project_file.

  ## Examples

      iex> create_project_file(%{field: value})
      {:ok, %ProjectFile{}}

      iex> create_project_file(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_file(attrs \\ %{}) do
    %ProjectFile{}
    |> ProjectFile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_file.

  ## Examples

      iex> update_project_file(project_file, %{field: new_value})
      {:ok, %ProjectFile{}}

      iex> update_project_file(project_file, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_file(%ProjectFile{} = project_file, attrs) do
    project_file
    |> ProjectFile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_file.

  ## Examples

      iex> delete_project_file(project_file)
      {:ok, %ProjectFile{}}

      iex> delete_project_file(project_file)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_file(%ProjectFile{} = project_file) do
    Repo.delete(project_file)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_file changes.

  ## Examples

      iex> change_project_file(project_file)
      %Ecto.Changeset{data: %ProjectFile{}}

  """
  def change_project_file(%ProjectFile{} = project_file, attrs \\ %{}) do
    ProjectFile.changeset(project_file, attrs)
  end

  alias ChatApp.Projects.Issue

  @doc """
  Returns the list of issues.

  ## Examples

      iex> list_issues()
      [%Issue{}, ...]

  """
  def list_issues do
    Repo.all(Issue)
  end

  def list_project_issues(project_id) do
    Issue
    |> where(project_id: ^project_id)
    |> Repo.all()
  end

  @doc """
  Gets a single issue.

  Raises `Ecto.NoResultsError` if the Issue does not exist.

  ## Examples

      iex> get_issue!(123)
      %Issue{}

      iex> get_issue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_issue!(id), do: Repo.get!(Issue, id)

  @doc """
  Creates a issue.

  ## Examples

      iex> create_issue(%{field: value})
      {:ok, %Issue{}}

      iex> create_issue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_issue(attrs \\ %{}) do
    %Issue{}
    |> Issue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a issue.

  ## Examples

      iex> update_issue(issue, %{field: new_value})
      {:ok, %Issue{}}

      iex> update_issue(issue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_issue(%Issue{} = issue, attrs) do
    issue
    |> Issue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a issue.

  ## Examples

      iex> delete_issue(issue)
      {:ok, %Issue{}}

      iex> delete_issue(issue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_issue(%Issue{} = issue) do
    Repo.delete(issue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking issue changes.

  ## Examples

      iex> change_issue(issue)
      %Ecto.Changeset{data: %Issue{}}

  """
  def change_issue(%Issue{} = issue, attrs \\ %{}) do
    Issue.changeset(issue, attrs)
  end
end
