#!/usr/bin/env ruby
require 'discordrb'
require_relative '../lib/calc.rb'
require_relative '../lib/add.rb'

<<<<<<< HEAD
class Bot
=======
module Bot
  bot = Discordrb::Bot.new token: 'new_token'
>>>>>>> ad650cad9b0edeee62b6a142134947bf993f900f

  def initialize(token_key)
    @bot = Discordrb::Bot.new token: token_key
    @time = Time.new
  end

  def guess_game
    @bot.message(start_with: '!guess') do |event|
      guess_word = "Wolfe"

      event.user.await(:guess) do |guess_event|
        guess = guess_event.message.content.to_s

        if guess == guess_word
          guess_event.respond 'You Win! it was ' + guess_word
        elsif guess != guess_word
          guess_event.respond 'Oops, wrong!'
          guess_event.respond 'Enter !guess to play again!' 
        end
      end
      event.respond 'Welcome to guess game!'
      event.respond 'Guess a random word'
    end
  end

  def date_of_birth
    @bot.message(start_with: '!date') do |event|
      year = Calculate.new
      event.user.await(:num) do |num_event|
        age_input = num_event.message.content.split(' ')
        age_input.each do |x|
          year.age(x.to_i)
        end
        num_event.respond year.result
      end
      event.respond 'Enter your age'
    end
  end

  def current_time
    @bot.message(start_with: '!time') do |event|
      event.respond @time
    end
  end

  def more_info
    @bot.message(start_with: '!about') do |event|
      info_num = 1
      event.user.await(:info) do |info_event|
        info = info_event.message.content.to_i
  
        if info == info_num
          info_event.respond 'I am gaming bot that plays guessing games,tells the time, calculates your birth year and gives compliments.'
        else
          info_event.respond(info > @info_num ? 'New Updates coming soon!' : 'Hello!')
          false
        end
      end
      event.respond 'Hey there press 1 for more info'
    end
  end

  def compliment
    @bot.message(start_with: '!compliment') do |event|
      event.user.await(:name) do |name_event|
        name = name_event.message.content.to_s
        
        name_event.respond(name + ' you are so cool!')
      end
      event.respond 'Enter your name:'
    end
  end

  def sum
    @bot.message(start_with: '!add') do |event|
      summed = Addition.new
      event.user.await(:num) do |num_event|
        num_input = num_event.message.content

        num_input.each do |x|
          summed.add(x.to_i)
        end
        num_event.respond summed.result
      end
      event.respond 'Hey there what numbers would you like to sum?'
    end
  end


  def start 
    @bot.run
  end
end
