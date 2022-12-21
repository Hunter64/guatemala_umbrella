defmodule GuatemalaWeb.ProductControllerTest do
  use GuatemalaWeb.ConnCase

  import Guatemala.ProductsFixtures

  @create_attrs %{active: true, catalog_id: 42, code: "some code", creator_user_id: 42, description: "some description", discount_id: 42, modifier_user_id: 42, price_id: 42, product_type_id: 42, provider_id: 42, stock_id: 42, trademark_id: 42}
  @update_attrs %{active: false, catalog_id: 43, code: "some updated code", creator_user_id: 43, description: "some updated description", discount_id: 43, modifier_user_id: 43, price_id: 43, product_type_id: 43, provider_id: 43, stock_id: 43, trademark_id: 43}
  @invalid_attrs %{active: nil, catalog_id: nil, code: nil, creator_user_id: nil, description: nil, discount_id: nil, modifier_user_id: nil, price_id: nil, product_type_id: nil, provider_id: nil, stock_id: nil, trademark_id: nil}

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Products"
    end
  end

  describe "new product" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :new))
      assert html_response(conn, 200) =~ "New Product"
    end
  end

  describe "create product" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.product_path(conn, :show, id)

      conn = get(conn, Routes.product_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Product"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Product"
    end
  end

  describe "edit product" do
    setup [:create_product]

    test "renders form for editing chosen product", %{conn: conn, product: product} do
      conn = get(conn, Routes.product_path(conn, :edit, product))
      assert html_response(conn, 200) =~ "Edit Product"
    end
  end

  describe "update product" do
    setup [:create_product]

    test "redirects when data is valid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @update_attrs)
      assert redirected_to(conn) == Routes.product_path(conn, :show, product)

      conn = get(conn, Routes.product_path(conn, :show, product))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Product"
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, Routes.product_path(conn, :delete, product))
      assert redirected_to(conn) == Routes.product_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_path(conn, :show, product))
      end
    end
  end

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end
end
