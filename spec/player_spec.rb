require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  before :each do
		@card1 = Card.new(:diamond, 'queen', 12)
		@card2 = Card.new(:heart, 'king', 13)
		@card3 = Card.new(:heart, 'three', 3)
		@card4 = Card.new(:club, '5', 5)
		@deck = Deck.new([@card1, @card2, @card3])
		@player = Player.new('john', @deck)
	end

	it 'exists' do
		expect(@player).to be_an_instance_of(Player)
	end
	it 'has a name' do
	  expect(@player.name).to eq('john')
	end
	it 'has a deck' do
		expect(@player.deck).to eq(@deck)
	end
	it 'knows when has_lost?' do
		@player.deck.remove_card
		expect(@player.has_lost?).to be_falsey
		@player.deck.remove_card
		expect(@player.has_lost?).to be_falsey
		@player.deck.remove_card
		expect(@player.has_lost?).to eq(true)
	end
end