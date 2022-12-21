defmodule Guatemala.ProductsTest do
  use Guatemala.DataCase

  alias Guatemala.Products

  describe "products" do
    alias Guatemala.Products.Product

    import Guatemala.ProductsFixtures

    @invalid_attrs %{active: nil, catalog_id: nil, code: nil, creator_user_id: nil, description: nil, discount_id: nil, modifier_user_id: nil, price_id: nil, product_type_id: nil, provider_id: nil, stock_id: nil, trademark_id: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{active: true, catalog_id: 42, code: "some code", creator_user_id: 42, description: "some description", discount_id: 42, modifier_user_id: 42, price_id: 42, product_type_id: 42, provider_id: 42, stock_id: 42, trademark_id: 42}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.active == true
      assert product.catalog_id == 42
      assert product.code == "some code"
      assert product.creator_user_id == 42
      assert product.description == "some description"
      assert product.discount_id == 42
      assert product.modifier_user_id == 42
      assert product.price_id == 42
      assert product.product_type_id == 42
      assert product.provider_id == 42
      assert product.stock_id == 42
      assert product.trademark_id == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{active: false, catalog_id: 43, code: "some updated code", creator_user_id: 43, description: "some updated description", discount_id: 43, modifier_user_id: 43, price_id: 43, product_type_id: 43, provider_id: 43, stock_id: 43, trademark_id: 43}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.active == false
      assert product.catalog_id == 43
      assert product.code == "some updated code"
      assert product.creator_user_id == 43
      assert product.description == "some updated description"
      assert product.discount_id == 43
      assert product.modifier_user_id == 43
      assert product.price_id == 43
      assert product.product_type_id == 43
      assert product.provider_id == 43
      assert product.stock_id == 43
      assert product.trademark_id == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end
end
