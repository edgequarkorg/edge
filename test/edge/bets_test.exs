defmodule Edge.BetsTest do
  use Edge.DataCase

  alias Edge.Bets

  describe "bets" do
    alias Edge.Bets.Bet

    @valid_attrs %{a_b: "some a_b", bet: "120.5", country: "some country", event: "some event", odd: "120.5", p_l: "120.5", stake: "120.5"}
    @update_attrs %{a_b: "some updated a_b", bet: "456.7", country: "some updated country", event: "some updated event", odd: "456.7", p_l: "456.7", stake: "456.7"}
    @invalid_attrs %{a_b: nil, bet: nil, country: nil, event: nil, odd: nil, p_l: nil, stake: nil}

    def bet_fixture(attrs \\ %{}) do
      {:ok, bet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bets.create_bet()

      bet
    end

    test "list_bets/0 returns all bets" do
      bet = bet_fixture()
      assert Bets.list_bets() == [bet]
    end

    test "get_bet!/1 returns the bet with given id" do
      bet = bet_fixture()
      assert Bets.get_bet!(bet.id) == bet
    end

    test "create_bet/1 with valid data creates a bet" do
      assert {:ok, %Bet{} = bet} = Bets.create_bet(@valid_attrs)
      assert bet.a_b == "some a_b"
      assert bet.bet == Decimal.new("120.5")
      assert bet.country == "some country"
      assert bet.event == "some event"
      assert bet.odd == Decimal.new("120.5")
      assert bet.p_l == Decimal.new("120.5")
      assert bet.stake == Decimal.new("120.5")
    end

    test "create_bet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bets.create_bet(@invalid_attrs)
    end

    test "update_bet/2 with valid data updates the bet" do
      bet = bet_fixture()
      assert {:ok, %Bet{} = bet} = Bets.update_bet(bet, @update_attrs)
      assert bet.a_b == "some updated a_b"
      assert bet.bet == Decimal.new("456.7")
      assert bet.country == "some updated country"
      assert bet.event == "some updated event"
      assert bet.odd == Decimal.new("456.7")
      assert bet.p_l == Decimal.new("456.7")
      assert bet.stake == Decimal.new("456.7")
    end

    test "update_bet/2 with invalid data returns error changeset" do
      bet = bet_fixture()
      assert {:error, %Ecto.Changeset{}} = Bets.update_bet(bet, @invalid_attrs)
      assert bet == Bets.get_bet!(bet.id)
    end

    test "delete_bet/1 deletes the bet" do
      bet = bet_fixture()
      assert {:ok, %Bet{}} = Bets.delete_bet(bet)
      assert_raise Ecto.NoResultsError, fn -> Bets.get_bet!(bet.id) end
    end

    test "change_bet/1 returns a bet changeset" do
      bet = bet_fixture()
      assert %Ecto.Changeset{} = Bets.change_bet(bet)
    end
  end
end
