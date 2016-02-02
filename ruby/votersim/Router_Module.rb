# For use with the voter simulation assignment - Wyncode 2016

module Router
	# Routes the user to the next choice path
	# Connects to the Interface class
	def router(input)
		@user_data.push(input) # Tracks history of user input
		@database.list
		case input
		when "create"
			@user_data = []
			puts "\n Please enter the name of this entity: \n\n"
			@user_data.push(gets.chomp.downcase)
		when "list"
			puts """
 Politicians: 
 -----------
 #{@database.candidate_names}

 Voters:
 ------
 #{@database.voter_names}

\n < Press ENTER to continue >
 """
			gets
		when "updater"
			@database.delete("politician",@user_data[-2]) # Delete the last name that was typed
			@database.delete("voter",@user_data[-2])
			return router("create")
		when "quit"
			exit
		when "yes_delete"
			@database.delete("politician",@user_data[-4]) # Delete the last name that was typed
			@database.delete("voter",@user_data[-4])
			puts "\n  > #{@user_data[-4]} has been removed from the database."
			load_text("main")
			gets
		when "no"
			load_text("main")
		end
		if @create_options.include?(input)
			@database.create(@user_data[-3],@user_data[-5],@user_data[-1]) # (entity, name, group)
			puts "\n  > #{@user_data[-5]} has been added to the database."
			load_text("main")
			gets
			return ask
		end
		load_text(input)
		return ask
	end
end
