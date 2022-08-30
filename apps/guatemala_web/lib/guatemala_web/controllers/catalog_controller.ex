defmodule GuatemalaWeb.CatalogController do
  use GuatemalaWeb, :controller

  alias Guatemala.Catalogs
  alias Guatemala.Catalogs.Catalog

  def index(conn, _params) do
    catalogs = Catalogs.list_catalogs()
    render(conn, "index.html", catalogs: catalogs)
  end

  def new(conn, _params) do
    changeset = Catalogs.change_catalog(%Catalog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"catalog" => catalog_params}) do
    case Catalogs.create_catalog(catalog_params) do
      {:ok, catalog} ->
        conn
        |> put_flash(:info, "Catalog created successfully.")
        |> redirect(to: Routes.catalog_path(conn, :show, catalog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    catalog = Catalogs.get_catalog!(id)
    render(conn, "show.html", catalog: catalog)
  end

  def edit(conn, %{"id" => id}) do
    catalog = Catalogs.get_catalog!(id)
    changeset = Catalogs.change_catalog(catalog)
    render(conn, "edit.html", catalog: catalog, changeset: changeset)
  end

  def update(conn, %{"id" => id, "catalog" => catalog_params}) do
    catalog = Catalogs.get_catalog!(id)

    case Catalogs.update_catalog(catalog, catalog_params) do
      {:ok, catalog} ->
        conn
        |> put_flash(:info, "Catalog updated successfully.")
        |> redirect(to: Routes.catalog_path(conn, :show, catalog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", catalog: catalog, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    catalog = Catalogs.get_catalog!(id)
    {:ok, _catalog} = Catalogs.delete_catalog(catalog)

    conn
    |> put_flash(:info, "Catalog deleted successfully.")
    |> redirect(to: Routes.catalog_path(conn, :index))
  end
end
