defmodule GuatemalaWeb.CreditTypeController do
  use GuatemalaWeb, :controller

  # alias Guatemala.CreditTypes
  # alias Guatemala.CreditTypes.CreditType

  alias Phoenix.LiveView
  alias GuatemalaWeb.UtilController

  def index(conn, _params) do
    conn
      |> LiveView.Controller.live_render(GuatemalaWeb.CreditTypeLiveView, session: %{})
  end

  # def index(conn, _params) do
  #   credit_types = CreditTypes.list_credit_types()
  #   render(conn, "index.html", credit_types: credit_types)
  # end

  # def new(conn, _params) do
  #   changeset = CreditTypes.change_credit_type(%CreditType{})
  #   render(conn, "new.html", changeset: changeset)
  # end

  # def create(conn, %{"credit_type" => credit_type_params}) do
  #   case CreditTypes.create_credit_type(credit_type_params) do
  #     {:ok, credit_type} ->
  #       conn
  #       |> put_flash(:info, "Credit type created successfully.")
  #       |> redirect(to: Routes.credit_type_path(conn, :show, credit_type))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   credit_type = CreditTypes.get_credit_type!(id)
  #   render(conn, "show.html", credit_type: credit_type)
  # end

  # def edit(conn, %{"id" => id}) do
  #   credit_type = CreditTypes.get_credit_type!(id)
  #   changeset = CreditTypes.change_credit_type(credit_type)
  #   render(conn, "edit.html", credit_type: credit_type, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "credit_type" => credit_type_params}) do
  #   credit_type = CreditTypes.get_credit_type!(id)

  #   case CreditTypes.update_credit_type(credit_type, credit_type_params) do
  #     {:ok, credit_type} ->
  #       conn
  #       |> put_flash(:info, "Credit type updated successfully.")
  #       |> redirect(to: Routes.credit_type_path(conn, :show, credit_type))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", credit_type: credit_type, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   credit_type = CreditTypes.get_credit_type!(id)
  #   {:ok, _credit_type} = CreditTypes.delete_credit_type(credit_type)

  #   conn
  #   |> put_flash(:info, "Credit type deleted successfully.")
  #   |> redirect(to: Routes.credit_type_path(conn, :index))
  # end
end
