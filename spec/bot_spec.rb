require './lib/game.rb'

RSpec.describe DiscordBot do
  let (:bot) {Bot.new}

  describe '#guess' do
    it 'checks if the number guessed by the player is equal to the random number' do
      bot.add(1)
      expect(bot.guess(1)).to eql(true)
    end
  end

end