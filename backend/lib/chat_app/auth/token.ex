defmodule ChatApp.Auth.Token do
  use Joken.Config
  
  @impl true
  def token_config do
    default_claims(default_exp: 60 * 60 * 24 * 7) # 7 days
  end

  # Create a token holding the user id
  def generate_and_sign!(%{"user_id" => _} = claims) do
    signer = Joken.Signer.create("HS256", Application.fetch_env!(:chat_app, ChatAppWeb.Endpoint)[:secret_key_base])
    {:ok, jwt, _claims} = generate_and_sign(claims, signer)
    jwt
  end

  # Verify the token
  def verify_and_validate!(jwt) do
    signer = Joken.Signer.create("HS256", Application.fetch_env!(:chat_app, ChatAppWeb.Endpoint)[:secret_key_base])
    case verify_and_validate(jwt, signer) do
      {:ok, claims} -> {:ok, claims}
      {:error, _} -> {:error, :unauthorized}
    end
  end
end
