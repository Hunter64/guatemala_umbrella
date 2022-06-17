defmodule GuatemalaWeb.DocumentTypeControllerTest do
  use GuatemalaWeb.ConnCase

  import Guatemala.DocumentTypesFixtures

  @create_attrs %{active: true, creator_user_id: 42, description: "some description", modifier_user_id: 42, name: "some name"}
  @update_attrs %{active: false, creator_user_id: 43, description: "some updated description", modifier_user_id: 43, name: "some updated name"}
  @invalid_attrs %{active: nil, creator_user_id: nil, description: nil, modifier_user_id: nil, name: nil}

  describe "index" do
    test "lists all document_types", %{conn: conn} do
      conn = get(conn, Routes.document_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Document types"
    end
  end

  describe "new document_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.document_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Document type"
    end
  end

  describe "create document_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.document_type_path(conn, :create), document_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.document_type_path(conn, :show, id)

      conn = get(conn, Routes.document_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Document type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.document_type_path(conn, :create), document_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Document type"
    end
  end

  describe "edit document_type" do
    setup [:create_document_type]

    test "renders form for editing chosen document_type", %{conn: conn, document_type: document_type} do
      conn = get(conn, Routes.document_type_path(conn, :edit, document_type))
      assert html_response(conn, 200) =~ "Edit Document type"
    end
  end

  describe "update document_type" do
    setup [:create_document_type]

    test "redirects when data is valid", %{conn: conn, document_type: document_type} do
      conn = put(conn, Routes.document_type_path(conn, :update, document_type), document_type: @update_attrs)
      assert redirected_to(conn) == Routes.document_type_path(conn, :show, document_type)

      conn = get(conn, Routes.document_type_path(conn, :show, document_type))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, document_type: document_type} do
      conn = put(conn, Routes.document_type_path(conn, :update, document_type), document_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Document type"
    end
  end

  describe "delete document_type" do
    setup [:create_document_type]

    test "deletes chosen document_type", %{conn: conn, document_type: document_type} do
      conn = delete(conn, Routes.document_type_path(conn, :delete, document_type))
      assert redirected_to(conn) == Routes.document_type_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.document_type_path(conn, :show, document_type))
      end
    end
  end

  defp create_document_type(_) do
    document_type = document_type_fixture()
    %{document_type: document_type}
  end
end
