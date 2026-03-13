defmodule ChatAppWeb.UserSocket do
  use Phoenix.Socket

  # Channels
  channel "chat_room:*", ChatAppWeb.ChatRoomChannel
  channel "board:*", ChatAppWeb.BoardChannel

  @impl true
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end
