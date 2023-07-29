require './lib/card'

class Deck
attr_reader :cards
  def initialize(array_of_cards)
		@cards = array_of_cards
	end

	def rank_of_card_at(index)
		@cards[index].rank
	end

	def high_ranking_cards
	  high_ranked_cards = @cards.select do |card|
			card.rank > 11
		end
	end

	def percentage_high_ranking
		(high_ranking_cards.length.to_f / @cards.length.to_f * 100.0).round(2)
	end

	def remove_card
		@cards.shift
	end

	def add_card(card)
		@cards.unshift(card)
	end
end
