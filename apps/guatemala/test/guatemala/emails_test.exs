defmodule Guatemala.EmailsTest do
  use Guatemala.DataCase

  alias Guatemala.Emails

  describe "emails" do
    alias Guatemala.Emails.Email

    import Guatemala.EmailsFixtures

    @invalid_attrs %{active: nil, catalog_id: nil, creator_user_id: nil, email: nil, modifier_user_id: nil, owner_id: nil}

    test "list_emails/0 returns all emails" do
      email = email_fixture()
      assert Emails.list_emails() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Emails.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      valid_attrs = %{active: true, catalog_id: 42, creator_user_id: 42, email: "some email", modifier_user_id: 42, owner_id: 42}

      assert {:ok, %Email{} = email} = Emails.create_email(valid_attrs)
      assert email.active == true
      assert email.catalog_id == 42
      assert email.creator_user_id == 42
      assert email.email == "some email"
      assert email.modifier_user_id == 42
      assert email.owner_id == 42
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()
      update_attrs = %{active: false, catalog_id: 43, creator_user_id: 43, email: "some updated email", modifier_user_id: 43, owner_id: 43}

      assert {:ok, %Email{} = email} = Emails.update_email(email, update_attrs)
      assert email.active == false
      assert email.catalog_id == 43
      assert email.creator_user_id == 43
      assert email.email == "some updated email"
      assert email.modifier_user_id == 43
      assert email.owner_id == 43
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Emails.update_email(email, @invalid_attrs)
      assert email == Emails.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Emails.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Emails.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Emails.change_email(email)
    end
  end
end
