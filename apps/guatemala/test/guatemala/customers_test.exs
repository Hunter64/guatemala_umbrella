defmodule Guatemala.CustomersTest do
  use Guatemala.DataCase

  alias Guatemala.Customers

  describe "customers" do
    alias Guatemala.Customers.Customer

    import Guatemala.CustomersFixtures

    @invalid_attrs %{active: nil, catalog_id: nil, comments: nil, creator_user_id: nil, credit_type_id: nil, first_name: nil, first_surname: nil, large_name: nil, modifier_user_id: nil, moral_person: nil, rfc: nil, second_name: nil, second_surname: nil, social_reason: nil}

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Customers.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Customers.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{active: true, catalog_id: 42, comments: "some comments", creator_user_id: 42, credit_type_id: 42, first_name: "some first_name", first_surname: "some first_surname", large_name: "some large_name", modifier_user_id: 42, moral_person: true, rfc: "some rfc", second_name: "some second_name", second_surname: "some second_surname", social_reason: "some social_reason"}

      assert {:ok, %Customer{} = customer} = Customers.create_customer(valid_attrs)
      assert customer.active == true
      assert customer.catalog_id == 42
      assert customer.comments == "some comments"
      assert customer.creator_user_id == 42
      assert customer.credit_type_id == 42
      assert customer.first_name == "some first_name"
      assert customer.first_surname == "some first_surname"
      assert customer.large_name == "some large_name"
      assert customer.modifier_user_id == 42
      assert customer.moral_person == true
      assert customer.rfc == "some rfc"
      assert customer.second_name == "some second_name"
      assert customer.second_surname == "some second_surname"
      assert customer.social_reason == "some social_reason"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{active: false, catalog_id: 43, comments: "some updated comments", creator_user_id: 43, credit_type_id: 43, first_name: "some updated first_name", first_surname: "some updated first_surname", large_name: "some updated large_name", modifier_user_id: 43, moral_person: false, rfc: "some updated rfc", second_name: "some updated second_name", second_surname: "some updated second_surname", social_reason: "some updated social_reason"}

      assert {:ok, %Customer{} = customer} = Customers.update_customer(customer, update_attrs)
      assert customer.active == false
      assert customer.catalog_id == 43
      assert customer.comments == "some updated comments"
      assert customer.creator_user_id == 43
      assert customer.credit_type_id == 43
      assert customer.first_name == "some updated first_name"
      assert customer.first_surname == "some updated first_surname"
      assert customer.large_name == "some updated large_name"
      assert customer.modifier_user_id == 43
      assert customer.moral_person == false
      assert customer.rfc == "some updated rfc"
      assert customer.second_name == "some updated second_name"
      assert customer.second_surname == "some updated second_surname"
      assert customer.social_reason == "some updated social_reason"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_customer(customer, @invalid_attrs)
      assert customer == Customers.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Customers.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Customers.change_customer(customer)
    end
  end
end
