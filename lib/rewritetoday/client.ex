defmodule Rewritetoday.Client do
  alias Rewritetoday.Config

  def request(%Config{api_url: api_url, api_key: api_key}, method, path, body \\ %{}, headers \\ [], opts \\ []) do
    query_params = Keyword.get(opts, :query_params, [])

    query_string =
      if query_params == [] do
        ""
      else
        "?" <> URI.encode_query(query_params)
      end

    endpoint_url = api_url <> path <> query_string

    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", api_key}
      | headers
    ]

    encoded_body = case body do
      nil -> nil
      %{} -> Config.json_library().encode!(body)
      _ -> body
    end

    response = Config.http_client().request(method, endpoint_url, headers, encoded_body, opts)

    with {:ok, %{status: status, body: response_body}} <- response do
      decoded =
        try do
          Config.json_library().decode!(response_body)
        rescue
          _ -> response_body
        end

      if status in 200..299 do
        {:ok, decoded}
      else
        {:error, %{response | body: decoded}}
      end
    end
  end

  def get(config, path, headers \\ [], opts \\ []) do
    request(config, "GET", path, %{}, headers, opts)
  end

  def post(config, path, body, headers \\ [], opts \\ []) do
    request(config, "POST", path, body, headers, opts)
  end

  def put(config, path, body, headers \\ [], opts \\ []) do
    request(config, "PUT", path, body, headers, opts)
  end

  def delete(config, path, headers \\ [], opts \\ []) do
    request(config, "DELETE", path, %{}, headers, opts)
  end

  def patch(config, path, body, headers \\ [], opts \\ []) do
    request(config, "PATCH", path, body, headers, opts)
  end
end
