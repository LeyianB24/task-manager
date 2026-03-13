defmodule ChatApp.Workbench do
  @moduledoc """
  The Workbench context.
  """

  import Ecto.Query, warn: false
  alias ChatApp.Repo

  alias ChatApp.Workbench.SavedRequest

  @doc """
  Returns the list of saved_requests.

  ## Examples

      iex> list_saved_requests()
      [%SavedRequest{}, ...]

  """
  def list_saved_requests do
    Repo.all(SavedRequest)
  end

  def list_user_saved_requests(user_id) do
    SavedRequest
    |> where(user_id: ^user_id)
    |> Repo.all()
  end

  @doc """
  Gets a single saved_request.

  Raises `Ecto.NoResultsError` if the Saved request does not exist.

  ## Examples

      iex> get_saved_request!(123)
      %SavedRequest{}

      iex> get_saved_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saved_request!(id), do: Repo.get!(SavedRequest, id)

  @doc """
  Creates a saved_request.

  ## Examples

      iex> create_saved_request(%{field: value})
      {:ok, %SavedRequest{}}

      iex> create_saved_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saved_request(attrs \\ %{}) do
    %SavedRequest{}
    |> SavedRequest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saved_request.

  ## Examples

      iex> update_saved_request(saved_request, %{field: new_value})
      {:ok, %SavedRequest{}}

      iex> update_saved_request(saved_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saved_request(%SavedRequest{} = saved_request, attrs) do
    saved_request
    |> SavedRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saved_request.

  ## Examples

      iex> delete_saved_request(saved_request)
      {:ok, %SavedRequest{}}

      iex> delete_saved_request(saved_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saved_request(%SavedRequest{} = saved_request) do
    Repo.delete(saved_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saved_request changes.

  ## Examples

      iex> change_saved_request(saved_request)
      %Ecto.Changeset{data: %SavedRequest{}}

  """
  def change_saved_request(%SavedRequest{} = saved_request, attrs \\ %{}) do
    SavedRequest.changeset(saved_request, attrs)
  end
end
