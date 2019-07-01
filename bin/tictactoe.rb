#!/usr/bin/env ruby

require_relative '../config/environment'

def start 
  puts "Welcome to Tic-Tac-Toe! Which kind of game would you like to play?
  0 - computer vs computer
  1 - you vs computer
  2 - you vs friend"
  input = gets.strip
  
  case input
    when "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
      puts "Would you like to play again?"
      loop_game
    
    when "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
      puts "Would you like to play again?"
      loop_game
    
    when "1"
     puts "Would you like to go first (y/n)?"
     turn_input = gets.strip
       if turn_input == "y"
      Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play 
       else 
      Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play 
       end 
      puts "Would you like to play again?"
      loop_game
    else 
    start 
  end
end

def loop_game
  puts "(y/n)"
  puts "Please put y or n"
  answer = gets.strip
  case answer
    when "y"
      start
    when "n"
      puts "Goodbye for now!"
    else
      loop_game
  end
end
start


 


