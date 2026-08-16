defmodule Rewritetoday.Application do
  alias Rewritetoday.Config
  use Application

  @impl true
  def start(_type, _args) do
    http_client = Config.http_client()

    children =
      if function_exported?(Code.ensure_loaded!(http_client), :child_spec, 0) do
        [http_client.child_spec()]
      else
        []
      end

    opts = [strategy: :rest_for_one, name: Rewritetoday.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
