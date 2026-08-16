defmodule Rewritetoday.HttpClient do
  @type method :: :get | :post | :delete | :put | :patch
  @type headers :: keyword()
  @type body :: iodata() | nil
  @type response ::
          {:ok, %{status: non_neg_integer(), body: any(), headers: headers()}} | {:error, term()}

  @callback child_spec() :: Supervisor.child_spec()
  @callback request(method(), String.t(), headers(), body(), keyword()) :: response()

  @optional_callbacks [child_spec: 0]
end
