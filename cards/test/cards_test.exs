defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck/0 creates a deck of 52 cards" do
    deck = Cards.create_deck()
    assert length(deck) == 52
  end

  test "shuffle/1 shuffles the deck" do
    deck = Cards.create_deck()
    shuffled_deck = Cards.shuffle(deck)
    refute deck == shuffled_deck
  end

end
