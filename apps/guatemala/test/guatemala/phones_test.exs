defmodule Guatemala.PhonesTest do
  use Guatemala.DataCase

  alias Guatemala.Phones

  describe "phones" do
    alias Guatemala.Phones.Phone

    import Guatemala.PhonesFixtures

    @invalid_attrs %{active: nil, catalog_id: nil, country_code: nil, creator_user_id: nil, extension: nil, lada_code: nil, modifier_user_id: nil, number: nil, owner_id: nil}

    test "list_phones/0 returns all phones" do
      phone = phone_fixture()
      assert Phones.list_phones() == [phone]
    end

    test "get_phone!/1 returns the phone with given id" do
      phone = phone_fixture()
      assert Phones.get_phone!(phone.id) == phone
    end

    test "create_phone/1 with valid data creates a phone" do
      valid_attrs = %{active: true, catalog_id: 42, country_code: "some country_code", creator_user_id: 42, extension: "some extension", lada_code: "some lada_code", modifier_user_id: 42, number: "some number", owner_id: 42}

      assert {:ok, %Phone{} = phone} = Phones.create_phone(valid_attrs)
      assert phone.active == true
      assert phone.catalog_id == 42
      assert phone.country_code == "some country_code"
      assert phone.creator_user_id == 42
      assert phone.extension == "some extension"
      assert phone.lada_code == "some lada_code"
      assert phone.modifier_user_id == 42
      assert phone.number == "some number"
      assert phone.owner_id == 42
    end

    test "create_phone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Phones.create_phone(@invalid_attrs)
    end

    test "update_phone/2 with valid data updates the phone" do
      phone = phone_fixture()
      update_attrs = %{active: false, catalog_id: 43, country_code: "some updated country_code", creator_user_id: 43, extension: "some updated extension", lada_code: "some updated lada_code", modifier_user_id: 43, number: "some updated number", owner_id: 43}

      assert {:ok, %Phone{} = phone} = Phones.update_phone(phone, update_attrs)
      assert phone.active == false
      assert phone.catalog_id == 43
      assert phone.country_code == "some updated country_code"
      assert phone.creator_user_id == 43
      assert phone.extension == "some updated extension"
      assert phone.lada_code == "some updated lada_code"
      assert phone.modifier_user_id == 43
      assert phone.number == "some updated number"
      assert phone.owner_id == 43
    end

    test "update_phone/2 with invalid data returns error changeset" do
      phone = phone_fixture()
      assert {:error, %Ecto.Changeset{}} = Phones.update_phone(phone, @invalid_attrs)
      assert phone == Phones.get_phone!(phone.id)
    end

    test "delete_phone/1 deletes the phone" do
      phone = phone_fixture()
      assert {:ok, %Phone{}} = Phones.delete_phone(phone)
      assert_raise Ecto.NoResultsError, fn -> Phones.get_phone!(phone.id) end
    end

    test "change_phone/1 returns a phone changeset" do
      phone = phone_fixture()
      assert %Ecto.Changeset{} = Phones.change_phone(phone)
    end
  end
end
