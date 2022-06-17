defmodule Guatemala.DocumentTypesTest do
  use Guatemala.DataCase

  alias Guatemala.DocumentTypes

  describe "document_types" do
    alias Guatemala.DocumentTypes.DocumentType

    import Guatemala.DocumentTypesFixtures

    @invalid_attrs %{active: nil, creator_user_id: nil, description: nil, modifier_user_id: nil, name: nil}

    test "list_document_types/0 returns all document_types" do
      document_type = document_type_fixture()
      assert DocumentTypes.list_document_types() == [document_type]
    end

    test "get_document_type!/1 returns the document_type with given id" do
      document_type = document_type_fixture()
      assert DocumentTypes.get_document_type!(document_type.id) == document_type
    end

    test "create_document_type/1 with valid data creates a document_type" do
      valid_attrs = %{active: true, creator_user_id: 42, description: "some description", modifier_user_id: 42, name: "some name"}

      assert {:ok, %DocumentType{} = document_type} = DocumentTypes.create_document_type(valid_attrs)
      assert document_type.active == true
      assert document_type.creator_user_id == 42
      assert document_type.description == "some description"
      assert document_type.modifier_user_id == 42
      assert document_type.name == "some name"
    end

    test "create_document_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DocumentTypes.create_document_type(@invalid_attrs)
    end

    test "update_document_type/2 with valid data updates the document_type" do
      document_type = document_type_fixture()
      update_attrs = %{active: false, creator_user_id: 43, description: "some updated description", modifier_user_id: 43, name: "some updated name"}

      assert {:ok, %DocumentType{} = document_type} = DocumentTypes.update_document_type(document_type, update_attrs)
      assert document_type.active == false
      assert document_type.creator_user_id == 43
      assert document_type.description == "some updated description"
      assert document_type.modifier_user_id == 43
      assert document_type.name == "some updated name"
    end

    test "update_document_type/2 with invalid data returns error changeset" do
      document_type = document_type_fixture()
      assert {:error, %Ecto.Changeset{}} = DocumentTypes.update_document_type(document_type, @invalid_attrs)
      assert document_type == DocumentTypes.get_document_type!(document_type.id)
    end

    test "delete_document_type/1 deletes the document_type" do
      document_type = document_type_fixture()
      assert {:ok, %DocumentType{}} = DocumentTypes.delete_document_type(document_type)
      assert_raise Ecto.NoResultsError, fn -> DocumentTypes.get_document_type!(document_type.id) end
    end

    test "change_document_type/1 returns a document_type changeset" do
      document_type = document_type_fixture()
      assert %Ecto.Changeset{} = DocumentTypes.change_document_type(document_type)
    end
  end
end
