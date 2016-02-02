# -----------------------------------------
# REPL Game - Wyncode Assignment for Week 1
# Written by Robert Anderson - January 2016
#
# Methods----------------
def new_game
  puts """
\n\n-------------------------------------------------------------------
\nWelcome to the REPL Game
\nCreate by Robert Anderson for
Wyncode FLL Cohort 4, Week1 homework
------------------------------------------------------------------
\n       (( Press ENTER to start the game ))"""
  gets # Wait on user to proceed
  sleep(0.4) # Wait x seconds
  puts """\n  Originally, this was a much more interesting game.
              ..but, I coded myself into a corner."""
  sleep(1.5)
  puts "\n\n   (( Press ENTER to continue ))"
  gets
  puts "\n  Refactoring Purgatory..  Well, let's see what started it all."
  gets
  usr_num = ask_num
  stairs = make_stairs(usr_num)
  sleep(1)
  puts "\n  So I started out by playing around with arrays."
  gets
  puts "  ..For example, you entered: #{usr_num}"
  gets
  puts "  Alright, here is an array based off that input: #{stairs}"
  gets
  puts "  And, if we execute the command 'array.push(array)', we get the following array: "
  stairs.push(stairs)
  gets
  puts "      #{stairs}"
  gets
  puts "\n  That's pretty cool, I guess.  I wonder what that '...' is all about?"
  gets
  puts "  Let's find out.  Use the 'up' and 'down' inputs to move along the array."
  gets
  return ask_move(1,stairs) # Defaulting your_loc as 1
end

def ask_num
  puts """
  \n  ------------------------------------------
  >> Please enter a number between 3 and 6: """
  input = gets.chomp
  options = ["3","4","5","6"]
  unless options.include?(input)
    puts "\n  Let's try that again.."
    return ask_num
  end
  return input.to_i
end

def make_stairs(floor_num)
  stairs = []
  floor_num.times {|i|
    temp = (i) # For each floor in floor_num, name it.
    stairs << temp # Save the floor name to the array before temp is overwritten.
  }
  return stairs
end


def ask_move(your_loc,stairs)
  puts "\n  You are currently at the number #{your_loc} in the array #{stairs}"
  puts "  >> Please enter either 'up' or 'down': "
  up_down = gets.chomp
  case up_down
  when "up"
    move(1,your_loc,stairs)
  when "down"
    move(-1,your_loc,stairs)
  else
    puts "\n  Let's try that again.."
    gets
    return ask_move(your_loc,stairs)
  end
end

def move(x,your_loc,stairs) # Stair climbing. If result is an array, pick and return an int.
  your_loc += x
  if x > stairs.length-1 # Added just in case the user is able to get outside index
    your_loc = stairs.length-1
  elsif your_loc < -1
    your_loc = -1
  end
  puts "      You are at the value #{stairs[your_loc]}"
  if stairs[your_loc].class != Fixnum
    return restart(stairs)
  end
  gets
  puts "\n      Let's keep moving along the array!"
  gets
  return ask_move(your_loc,stairs)
end

def restart(stairs)
  gets
  puts "\n  ..so, what happened?"
  gets
  puts "\n  Well, the object id for the array is: #{stairs.object_id}"
  puts "  ..And the object id for the array[-1] is: #{stairs[-1].object_id}"
  gets
  puts "\n  So, as you can see, the array is actually referencing itself at the final index."
  gets
  sleep(0.4)
  puts "\n  Pretty cool, huh?"
  gets
  puts "\n  Originally, this game was going to be a mystery puzzler \
  \n  about a pizza delivery person trapped in a Penrose Staircase."
  gets
  puts "\n  Yeah.."
  gets
  puts "  But, I really should have made a game about coding yourself into an infinite loop."
  gets
  puts "\n  Maybe I will."
  gets
  puts "  Would you play it?"
  yes_no = gets.chomp.downcase
  until yes_no != ""
    yes_no = gets.chomp.downcase
  end
  if yes_no == "yes" || yes_no == "y"
    return new_game
  else
    exit
  end
end

# Game Start -----------------------
new_game
