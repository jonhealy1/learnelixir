defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]

    for suit <- suits, value <- values, do: "#{value} of #{suit}"
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, n) do
    {hand, remaining_deck} = Enum.split(deck, n)
    {hand, remaining_deck}
  end

  def create_shuffled_and_deal(n) do
    deck = create_deck()
    shuffled_deck = shuffle(deck)
    {hand, _remaining_deck} = deal(shuffled_deck, n)
    hand
  end

  def save_deck(deck, filename) do
    File.write!(filename, deck)
  end

end
