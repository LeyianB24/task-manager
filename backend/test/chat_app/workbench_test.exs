defmodule ChatApp.WorkbenchTest do
  use ChatApp.DataCase

  alias ChatApp.Workbench

  describe "saved_requests" do
    alias ChatApp.Workbench.SavedRequest

    import ChatApp.WorkbenchFixtures

    @invalid_attrs %{body: nil, headers: nil, method: nil, name: nil, url: nil}

    test "list_saved_requests/0 returns all saved_requests" do
      saved_request = saved_request_fixture()
      assert Workbench.list_saved_requests() == [saved_request]
    end

    test "get_saved_request!/1 returns the saved_request with given id" do
      saved_request = saved_request_fixture()
      assert Workbench.get_saved_request!(saved_request.id) == saved_request
    end

    test "create_saved_request/1 with valid data creates a saved_request" do
      valid_attrs = %{body: "some body", headers: %{}, method: "some method", name: "some name", url: "some url"}

      assert {:ok, %SavedRequest{} = saved_request} = Workbench.create_saved_request(valid_attrs)
      assert saved_request.body == "some body"
      assert saved_request.headers == %{}
      assert saved_request.method == "some method"
      assert saved_request.name == "some name"
      assert saved_request.url == "some url"
    end

    test "create_saved_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workbench.create_saved_request(@invalid_attrs)
    end

    test "update_saved_request/2 with valid data updates the saved_request" do
      saved_request = saved_request_fixture()
      update_attrs = %{body: "some updated body", headers: %{}, method: "some updated method", name: "some updated name", url: "some updated url"}

      assert {:ok, %SavedRequest{} = saved_request} = Workbench.update_saved_request(saved_request, update_attrs)
      assert saved_request.body == "some updated body"
      assert saved_request.headers == %{}
      assert saved_request.method == "some updated method"
      assert saved_request.name == "some updated name"
      assert saved_request.url == "some updated url"
    end

    test "update_saved_request/2 with invalid data returns error changeset" do
      saved_request = saved_request_fixture()
      assert {:error, %Ecto.Changeset{}} = Workbench.update_saved_request(saved_request, @invalid_attrs)
      assert saved_request == Workbench.get_saved_request!(saved_request.id)
    end

    test "delete_saved_request/1 deletes the saved_request" do
      saved_request = saved_request_fixture()
      assert {:ok, %SavedRequest{}} = Workbench.delete_saved_request(saved_request)
      assert_raise Ecto.NoResultsError, fn -> Workbench.get_saved_request!(saved_request.id) end
    end

    test "change_saved_request/1 returns a saved_request changeset" do
      saved_request = saved_request_fixture()
      assert %Ecto.Changeset{} = Workbench.change_saved_request(saved_request)
    end
  end
end
