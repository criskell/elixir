ExUnit.start()
Mox.defmock(Rewritetoday.HttpClientMock, for: Rewritetoday.HttpClient)
Application.put_env(:rewritetoday, :http_client, Rewritetoday.HttpClientMock)
Application.put_env(:rewritetoday, :json_library, Jason)
