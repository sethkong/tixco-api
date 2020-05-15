defmodule TixcoWeb.UserControllerTest do
  use TixcoWeb.ConnCase

  alias Tixco.UserFixture
  alias Tixco.FixtureHelper

  setup %{conn: conn, jwt: jwt} do
    new_conn = conn
    |> put_req_header("authorization", "Bearer #{jwt}")
    |> put_req_header("accept", "application/json")
    {:ok, conn: new_conn}
  end
  
  describe "create/signup user" do
    test "renders user when data is valid", %{conn: conn} do
         user_attrs = Map.put(UserFixture.valid_attrs(), :email, FixtureHelper.rand_email())
	 conn = post(conn, "api/v1/signup", user: user_attrs)
	 assert %{"id" => id} = json_response(conn, 200)["data"]
	 assert id > 0
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, "api/v1/signup", user: UserFixture.invalid_attrs())
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
