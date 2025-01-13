defmodule Cards do
  @moduledoc """
  A module for creating and manipulating decks of cards.
  """

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
    {status, binary} = File.read(filename)
    case status do
      :ok -> {:ok, :erlang.binary_to_term(binary)}
      _ -> {:error, :file_not_found}
    end
  end

  def create_hand(n) do
    Cards.create_deck |> Cards.shuffle |> Cards.deal(n)
  end

end
