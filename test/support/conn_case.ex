defmodule TixcoWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate
  alias Tixco.AccountFixture

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest
      alias TixcoWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint TixcoWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Tixco.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Tixco.Repo, {:shared, self()})
    end

    %{jwt: jwt, user: user} = AccountFixture.create_user()
    
    {:ok, conn: Phoenix.ConnTest.build_conn(), jwt: jwt, user: user}
  end
end
