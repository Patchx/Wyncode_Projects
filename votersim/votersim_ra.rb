# ---- Hierarchy ----
# Interface [Load_Text, Router] >> Database [Voting_Model] >> Arrays of Entities

# ---- Modules ----
require "./Voting_Module"
require "./Load_Text_Module"
require "./Router_Module"
require "./Tests_Module"

# ---- Classes ----
class Database
	attr_reader :politicians, :voters, :candidate_names, :voter_names
	def initialize(politicians=[], voters=[])
		@politicians = politicians
		@voters = voters
		@candidate_names = [] # Lists politicians by name only
		@voter_names = [] # Lists voters by name only
	end

	def create(entity, name, group) # Entity data stored in arrays, not variable names.
		if entity == "politician"
			@politicians << Politician.new(name, group)
		elsif entity == "voter"
			@voters << Voter.new(name, group)
		else
			nil
		end
	end

	def list
		@candidate_names = []
		@politicians.each do |name|	(@candidate_names << name.name) end
		@voter_names = []
		@voters.each do |name|	(@voter_names << name.name) end
	end

	def delete(entity, name)
		if entity == "politician"
			@politicians.delete_if {|entry| entry.name == name}
		elsif entity == "voter"
			@voters.delete_if {|entry| entry.name == name}
		end
	end
end

class Interface
	include Load_Text # For changing text display and input logic
	include Router # For routing the user along the decision tree
	def initialize
		@database = Database.new
		@choices = {key: "key"} # In case load_text fails
		@user_data = [] # For passing user inputs to the database
		@create_options ||= [] # In case load_text fails
	end

	def welcome
		puts "\e[H\e[2J" # Clears the screen
		puts """
  ------------------------------
 |  Voter Sim v0.1              |
 |                              |
 |  Created by Robert Anderson  |
 |  for Wyncode Cohort 4 FLL    |
  ------------------------------

  < Press ENTER to initialize >
		"""
		gets
		load_text("main")
		return ask
	end

	def ask
		puts "\e[H\e[2J" # Clears the screen
		puts """
 ----------------------------------------
 #{@question}
 ----------------------------------------
 #{@options}

		"""
		@database.list if @options == "" # If options are none, show the list of entities
		choice = gets.chomp.downcase
		return welcome if (@choices.values == ["key"]) # Restart program if there is a load_text error
		@choices.keys.each do |key|
			if @choices[key].include? choice
				@user_data.push(choice) # Tracks history of user input
				choice = key
				return router(choice)
			end
		end
		# If input didn't match a choice:
		return ask
	end
end

# ---- Imported Model ----
include Voting_Model

# ---- Initializing Variables ----
interface = Interface.new

# ---- Tests ----
include Tests

# Run Test
tests # Uncomment to run the tests

# ---- Execute ----
interface = Interface.new
interface.welcome
