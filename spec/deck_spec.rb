require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
	before :each do
		@card1 = Card.new(:diamond, 'queen', 12)
		@card2 = Card.new(:heart, 'king', 13)
		@card3 = Card.new(:heart, 'three', 3)
		@card4 = Card.new(:club, '5', 5)
		@deck = Deck.new([@card1, @card2, @card3])
	end
  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
	end
	it 'reads cards' do
		expect(@deck.cards).to eq([@card1, @card2, @card3])
	end
	it 'return card rank' do
	  expect(@deck.rank_of_card_at(0)).to eq(12)
	end
	it 'returns high ranking cards' do
		expect(@deck.high_ranking_cards).to eq([@card1, @card2])
	end
	it 'returns percentage of held high cards' do
	  expect(@deck.percentage_high_ranking).to eq(66.67)
	end
	it 'removes cards' do
	  expect(@deck.remove_card).to eq(@card1)
		expect(@deck.cards).to eq([@card2, @card3])
	end
	it 'adds cards' do
		expect(@deck.add_card(@card4)).to eq([@card4, @card1, @card2, @card3])
	end
end