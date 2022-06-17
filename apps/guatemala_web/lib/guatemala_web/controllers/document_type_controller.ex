defmodule GuatemalaWeb.DocumentTypeController do
  use GuatemalaWeb, :controller

  alias Phoenix.LiveView
  alias GuatemalaWeb.UtilController

  def index(conn, _params) do
    conn
      |> LiveView.Controller.live_render(GuatemalaWeb.DocumentTypeLiveView, session: %{})
  end


  # alias Guatemala.DocumentTypes
  # alias Guatemala.DocumentTypes.DocumentType

  # def index(conn, _params) do
  #   document_types = DocumentTypes.list_document_types()
  #   render(conn, "index.html", document_types: document_types)
  # end

  # def new(conn, _params) do
  #   changeset = DocumentTypes.change_document_type(%DocumentType{})
  #   render(conn, "new.html", changeset: changeset)
  # end

  # def create(conn, %{"document_type" => document_type_params}) do
  #   case DocumentTypes.create_document_type(document_type_params) do
  #     {:ok, document_type} ->
  #       conn
  #       |> put_flash(:info, "Document type created successfully.")
  #       |> redirect(to: Routes.document_type_path(conn, :show, document_type))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   document_type = DocumentTypes.get_document_type!(id)
  #   render(conn, "show.html", document_type: document_type)
  # end

  # def edit(conn, %{"id" => id}) do
  #   document_type = DocumentTypes.get_document_type!(id)
  #   changeset = DocumentTypes.change_document_type(document_type)
  #   render(conn, "edit.html", document_type: document_type, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "document_type" => document_type_params}) do
  #   document_type = DocumentTypes.get_document_type!(id)

  #   case DocumentTypes.update_document_type(document_type, document_type_params) do
  #     {:ok, document_type} ->
  #       conn
  #       |> put_flash(:info, "Document type updated successfully.")
  #       |> redirect(to: Routes.document_type_path(conn, :show, document_type))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", document_type: document_type, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   document_type = DocumentTypes.get_document_type!(id)
  #   {:ok, _document_type} = DocumentTypes.delete_document_type(document_type)

  #   conn
  #   |> put_flash(:info, "Document type deleted successfully.")
  #   |> redirect(to: Routes.document_type_path(conn, :index))
  # end
end
