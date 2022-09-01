defmodule GuatemalaWeb.CustomerControllerTest do
  use GuatemalaWeb.ConnCase

  import Guatemala.CustomersFixtures

  @create_attrs %{active: true, catalog_id: 42, comments: "some comments", creator_user_id: 42, credit_type_id: 42, first_name: "some first_name", first_surname: "some first_surname", large_name: "some large_name", modifier_user_id: 42, moral_person: true, rfc: "some rfc", second_name: "some second_name", second_surname: "some second_surname", social_reason: "some social_reason"}
  @update_attrs %{active: false, catalog_id: 43, comments: "some updated comments", creator_user_id: 43, credit_type_id: 43, first_name: "some updated first_name", first_surname: "some updated first_surname", large_name: "some updated large_name", modifier_user_id: 43, moral_person: false, rfc: "some updated rfc", second_name: "some updated second_name", second_surname: "some updated second_surname", social_reason: "some updated social_reason"}
  @invalid_attrs %{active: nil, catalog_id: nil, comments: nil, creator_user_id: nil, credit_type_id: nil, first_name: nil, first_surname: nil, large_name: nil, modifier_user_id: nil, moral_person: nil, rfc: nil, second_name: nil, second_surname: nil, social_reason: nil}

  describe "index" do
    test "lists all customers", %{conn: conn} do
      conn = get(conn, Routes.customer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Customers"
    end
  end

  describe "new customer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.customer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Customer"
    end
  end

  describe "create customer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.customer_path(conn, :create), customer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.customer_path(conn, :show, id)

      conn = get(conn, Routes.customer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Customer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.customer_path(conn, :create), customer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Customer"
    end
  end

  describe "edit customer" do
    setup [:create_customer]

    test "renders form for editing chosen customer", %{conn: conn, customer: customer} do
      conn = get(conn, Routes.customer_path(conn, :edit, customer))
      assert html_response(conn, 200) =~ "Edit Customer"
    end
  end

  describe "update customer" do
    setup [:create_customer]

    test "redirects when data is valid", %{conn: conn, customer: customer} do
      conn = put(conn, Routes.customer_path(conn, :update, customer), customer: @update_attrs)
      assert redirected_to(conn) == Routes.customer_path(conn, :show, customer)

      conn = get(conn, Routes.customer_path(conn, :show, customer))
      assert html_response(conn, 200) =~ "some updated comments"
    end

    test "renders errors when data is invalid", %{conn: conn, customer: customer} do
      conn = put(conn, Routes.customer_path(conn, :update, customer), customer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Customer"
    end
  end

  describe "delete customer" do
    setup [:create_customer]

    test "deletes chosen customer", %{conn: conn, customer: customer} do
      conn = delete(conn, Routes.customer_path(conn, :delete, customer))
      assert redirected_to(conn) == Routes.customer_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.customer_path(conn, :show, customer))
      end
    end
  end

  defp create_customer(_) do
    customer = customer_fixture()
    %{customer: customer}
  end
end
