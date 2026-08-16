defmodule Rewritetoday.Clients.Messages do
  alias Rewritetoday.Client

  def send(config, payload) do
    Client.post(config, "/api/v1/messages", payload)
  end
end
