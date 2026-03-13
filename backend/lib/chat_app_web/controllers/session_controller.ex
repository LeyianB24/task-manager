defmodule ChatAppWeb.SessionController do
  use ChatAppWeb, :controller

  alias ChatApp.Accounts
  alias ChatApp.Auth.Token

  action_fallback ChatAppWeb.FallbackController

  def create(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        token = Token.create_token(user.id)

        conn
        |> put_status(:ok)
        |> json(%{user: %{id: user.id, email: user.email, name: user.name}, token: token})

      {:error, :unauthorized} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid email or password"})

      {:error, :not_found} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid email or password"})
    end
  end
end
