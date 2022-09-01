defmodule GuatemalaWeb.CreditTypeControllerTest do
  use GuatemalaWeb.ConnCase

  import Guatemala.CreditTypesFixtures

  @create_attrs %{active: true, creator_user_id: 42, description: "some description", modifier_user_id: 42, name: "some name"}
  @update_attrs %{active: false, creator_user_id: 43, description: "some updated description", modifier_user_id: 43, name: "some updated name"}
  @invalid_attrs %{active: nil, creator_user_id: nil, description: nil, modifier_user_id: nil, name: nil}

  describe "index" do
    test "lists all credit_types", %{conn: conn} do
      conn = get(conn, Routes.credit_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Credit types"
    end
  end

  describe "new credit_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.credit_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Credit type"
    end
  end

  describe "create credit_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.credit_type_path(conn, :create), credit_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.credit_type_path(conn, :show, id)

      conn = get(conn, Routes.credit_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Credit type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.credit_type_path(conn, :create), credit_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Credit type"
    end
  end

  describe "edit credit_type" do
    setup [:create_credit_type]

    test "renders form for editing chosen credit_type", %{conn: conn, credit_type: credit_type} do
      conn = get(conn, Routes.credit_type_path(conn, :edit, credit_type))
      assert html_response(conn, 200) =~ "Edit Credit type"
    end
  end

  describe "update credit_type" do
    setup [:create_credit_type]

    test "redirects when data is valid", %{conn: conn, credit_type: credit_type} do
      conn = put(conn, Routes.credit_type_path(conn, :update, credit_type), credit_type: @update_attrs)
      assert redirected_to(conn) == Routes.credit_type_path(conn, :show, credit_type)

      conn = get(conn, Routes.credit_type_path(conn, :show, credit_type))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, credit_type: credit_type} do
      conn = put(conn, Routes.credit_type_path(conn, :update, credit_type), credit_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Credit type"
    end
  end

  describe "delete credit_type" do
    setup [:create_credit_type]

    test "deletes chosen credit_type", %{conn: conn, credit_type: credit_type} do
      conn = delete(conn, Routes.credit_type_path(conn, :delete, credit_type))
      assert redirected_to(conn) == Routes.credit_type_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.credit_type_path(conn, :show, credit_type))
      end
    end
  end

  defp create_credit_type(_) do
    credit_type = credit_type_fixture()
    %{credit_type: credit_type}
  end
end
