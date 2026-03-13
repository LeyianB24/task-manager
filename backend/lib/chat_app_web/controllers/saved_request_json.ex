defmodule ChatAppWeb.SavedRequestJSON do
  def index(%{saved_requests: saved_requests}) do
    %{data: for(saved_request <- saved_requests, do: data(saved_request))}
  end

  def show(%{saved_request: saved_request}) do
    %{data: data(saved_request)}
  end

  def data(saved_request) do
    %{
      id: saved_request.id,
      name: saved_request.name,
      method: saved_request.method,
      url: saved_request.url,
      headers: saved_request.headers,
      body: saved_request.body,
      user_id: saved_request.user_id
    }
  end
end
