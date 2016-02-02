# For use with the voter simulation assignment - Wyncode 2016

module Tests
	def tests
		puts "\e[H\e[2J" # Clears the screen
		puts "\n--- Beginning of Tests -------------------------------------"

		# ---- Database Tests ----
		puts "\nCreating Database"
		test_database = Database.new
		test_database.create("politician", "test_Govenor", "Republican")
		test_database.create("voter", "test_Jill", "Liberal")
		test_database.create("politician", "test_Mayor", "Democrat")
		test_database.create("voter", "test_Bob", "Conservative")
		test_database.list
		puts "\nDeleting entities"
		test_database.delete("politician","test_Mayor")
		test_database.delete("voter","test_Bob")
		test_database.list

		# ---- Entity Tests ----
		gets
		puts "\e[H\e[2J" # Clears the screen
		puts "Entity Tests"
		test_politician = Politician.new("t_name", "t_party")
		puts "\nTest Politician:"
		p test_politician
		test_voter = Voter.new("t_name", "t_politics")
		puts "\nTest Voter:"
		p test_voter

		# ---- Interface Tests ----
		puts "\n\n< Interface tests >"
		gets
		test_interface = Interface.new
		test_interface.ask
		test_interface.load_text("main")
		test_interface.ask
		test_interface.welcome

		puts "--- End of Tests -------------------------------------------"
	end
end
