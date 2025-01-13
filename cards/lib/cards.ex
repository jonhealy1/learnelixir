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

  def save_deck(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write!(filename, binary)
  end

  def load_deck(filename) do
    case File.read(filename) do
      :ok -> :erlang.binary_to_term(binary)
      :error -> {:error, "File not found"}
    end

  end

  def create_hand(n) do
    Cards.create_deck |> Cards.shuffle |> Cards.deal(n)
  end

end
