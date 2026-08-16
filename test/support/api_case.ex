defmodule Rewritetoday.ApiCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Mox
      alias Rewritetoday.Config

      setup :verify_on_exit!

      setup_all do
        config = %Config{
          api_key: "isso non existe",
          api_url: "https://api.rewritetoday.com"
        }

        {:ok, config: config}
      end
    end
  end
end
