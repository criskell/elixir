defmodule Rewritetoday.Config do
  @moduledoc """
  Configuration of RewriteToday SDK.
  """

  alias Rewritetoday.{FinchClient, JasonLibrary}

  @api_url "https://api.rewritetoday.com"

  @type t :: %__MODULE__{
          api_url: String.t(),
          api_key: String.t()
        }

  defstruct [:api_url, :api_key]

  def new(api_key) do
    new(api_key, @api_url)
  end

  def new(api_key, api_url) do
    %__MODULE__{
      api_url: api_url,
      api_key: api_key
    }
  end

  def json_library do
    Application.get_env(:rewritetoday, :json_library, JasonLibrary)
  end

  def http_client do
    Application.get_env(:rewritetoday, :http_client, FinchClient)
  end
end
