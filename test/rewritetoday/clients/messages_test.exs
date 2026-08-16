defmodule Rewritetoday.Clients.MessagesTest do
  use Rewritetoday.ApiCase, async: true
  import Mox
  import Rewritetoday.Test.HttpMockHelpers

  alias Rewritetoday.Clients.Messages

  test "send", %{config: config} do
    req_payload = %{"message" => "mamamia"}

    response = %{"response" => "simulated"}

    mock_request(
      :post,
      "/api/v1/messages",
      req_payload,
      status: 201,
      body: response
    )

    assert {:ok, ^response} = Messages.send(config, req_payload)
  end
end
