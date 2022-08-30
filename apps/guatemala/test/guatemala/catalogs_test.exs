defmodule Guatemala.CatalogsTest do
  use Guatemala.DataCase

  alias Guatemala.Catalogs

  describe "catalogs" do
    alias Guatemala.Catalogs.Catalog

    import Guatemala.CatalogsFixtures

    @invalid_attrs %{active: nil, creator_user_id: nil, description: nil, modifier_user_id: nil, name: nil}

    test "list_catalogs/0 returns all catalogs" do
      catalog = catalog_fixture()
      assert Catalogs.list_catalogs() == [catalog]
    end

    test "get_catalog!/1 returns the catalog with given id" do
      catalog = catalog_fixture()
      assert Catalogs.get_catalog!(catalog.id) == catalog
    end

    test "create_catalog/1 with valid data creates a catalog" do
      valid_attrs = %{active: true, creator_user_id: 42, description: "some description", modifier_user_id: 42, name: "some name"}

      assert {:ok, %Catalog{} = catalog} = Catalogs.create_catalog(valid_attrs)
      assert catalog.active == true
      assert catalog.creator_user_id == 42
      assert catalog.description == "some description"
      assert catalog.modifier_user_id == 42
      assert catalog.name == "some name"
    end

    test "create_catalog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogs.create_catalog(@invalid_attrs)
    end

    test "update_catalog/2 with valid data updates the catalog" do
      catalog = catalog_fixture()
      update_attrs = %{active: false, creator_user_id: 43, description: "some updated description", modifier_user_id: 43, name: "some updated name"}

      assert {:ok, %Catalog{} = catalog} = Catalogs.update_catalog(catalog, update_attrs)
      assert catalog.active == false
      assert catalog.creator_user_id == 43
      assert catalog.description == "some updated description"
      assert catalog.modifier_user_id == 43
      assert catalog.name == "some updated name"
    end

    test "update_catalog/2 with invalid data returns error changeset" do
      catalog = catalog_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogs.update_catalog(catalog, @invalid_attrs)
      assert catalog == Catalogs.get_catalog!(catalog.id)
    end

    test "delete_catalog/1 deletes the catalog" do
      catalog = catalog_fixture()
      assert {:ok, %Catalog{}} = Catalogs.delete_catalog(catalog)
      assert_raise Ecto.NoResultsError, fn -> Catalogs.get_catalog!(catalog.id) end
    end

    test "change_catalog/1 returns a catalog changeset" do
      catalog = catalog_fixture()
      assert %Ecto.Changeset{} = Catalogs.change_catalog(catalog)
    end
  end
end
