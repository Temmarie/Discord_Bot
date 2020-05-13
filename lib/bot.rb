require 'discordrb'
# require_relative '../lib/board.rb'
# require_relative '../lib/players.rb'

module Bot
  bot = Discordrb::Bot.new token: 'NzA2Nzk0MTEwMzA4MDU3MTMw.Xrkr_g.7vauFNxaDbUjjRK8d_Sfgk8Cm8Q'

  bot.message(start_with: '!game') do |event|
    random_num = rand(1..5)

    event.user.await(:guess) do |guess_event|
      guess = guess_event.message.content.to_i

      if guess == random_num
        guess_event.respond 'You Win!'
      else
        guess_event.respond(guess > random_num ? 'Oops, wrong!' : 'almost there!')
        false
      end
    end
    event.respond 'Guess a num between 1 and 5'
  end

  bot.message(start_with: '!about') do |event|
    info_num = 1
    event.user.await(:info) do |info_event|
      info = info_event.message.content.to_i

      if info == info_num
        info_event.respond 'I am gaming bot that plays guessing games and gives compliments.'
      else
        info_event.respond ( info > info_num ? 'New Updates coming soon!' : 'Hello!')
        false
      end
    end
    event.respond 'Hey there what would you like to know?'
  end

  bot.message(start_with: '!compliment') do |event|
    event.user.await(:name) do |name_event|
      name = name_event.message.content.to_s

      name_event.respond (name + ' you are so cool!')
    end
    event.respond 'Enter your name:'
  end

  bot.run
end
