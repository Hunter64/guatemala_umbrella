defmodule Guatemala.CreditTypesTest do
  use Guatemala.DataCase

  alias Guatemala.CreditTypes

  describe "credit_types" do
    alias Guatemala.CreditTypes.CreditType

    import Guatemala.CreditTypesFixtures

    @invalid_attrs %{active: nil, creator_user_id: nil, description: nil, modifier_user_id: nil, name: nil}

    test "list_credit_types/0 returns all credit_types" do
      credit_type = credit_type_fixture()
      assert CreditTypes.list_credit_types() == [credit_type]
    end

    test "get_credit_type!/1 returns the credit_type with given id" do
      credit_type = credit_type_fixture()
      assert CreditTypes.get_credit_type!(credit_type.id) == credit_type
    end

    test "create_credit_type/1 with valid data creates a credit_type" do
      valid_attrs = %{active: true, creator_user_id: 42, description: "some description", modifier_user_id: 42, name: "some name"}

      assert {:ok, %CreditType{} = credit_type} = CreditTypes.create_credit_type(valid_attrs)
      assert credit_type.active == true
      assert credit_type.creator_user_id == 42
      assert credit_type.description == "some description"
      assert credit_type.modifier_user_id == 42
      assert credit_type.name == "some name"
    end

    test "create_credit_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CreditTypes.create_credit_type(@invalid_attrs)
    end

    test "update_credit_type/2 with valid data updates the credit_type" do
      credit_type = credit_type_fixture()
      update_attrs = %{active: false, creator_user_id: 43, description: "some updated description", modifier_user_id: 43, name: "some updated name"}

      assert {:ok, %CreditType{} = credit_type} = CreditTypes.update_credit_type(credit_type, update_attrs)
      assert credit_type.active == false
      assert credit_type.creator_user_id == 43
      assert credit_type.description == "some updated description"
      assert credit_type.modifier_user_id == 43
      assert credit_type.name == "some updated name"
    end

    test "update_credit_type/2 with invalid data returns error changeset" do
      credit_type = credit_type_fixture()
      assert {:error, %Ecto.Changeset{}} = CreditTypes.update_credit_type(credit_type, @invalid_attrs)
      assert credit_type == CreditTypes.get_credit_type!(credit_type.id)
    end

    test "delete_credit_type/1 deletes the credit_type" do
      credit_type = credit_type_fixture()
      assert {:ok, %CreditType{}} = CreditTypes.delete_credit_type(credit_type)
      assert_raise Ecto.NoResultsError, fn -> CreditTypes.get_credit_type!(credit_type.id) end
    end

    test "change_credit_type/1 returns a credit_type changeset" do
      credit_type = credit_type_fixture()
      assert %Ecto.Changeset{} = CreditTypes.change_credit_type(credit_type)
    end
  end
end
