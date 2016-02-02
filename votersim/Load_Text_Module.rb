# For use with the voter simulation assignment - Wyncode 2016

module Load_Text 
	# For changing text display and input logic
	# Connects to the interface class
	def load_text(variant)
		@create_options = ["democrat","republican","liberal","conservative","tea_party","socialist","neutral"]
		case variant
		when "main"
			@question = "What would you like to do?"
			@options =  "(C)reate, (L)ist, (U)pdate, (D)elete, (Q)uit"
			@choices = {
				"create" =>  ["create", "c"],
				"list" =>    ["list", "l"],
				"update" =>  ["update", "u"],
				"delete" =>  ["delete", "d"],
				"quit" =>    ["quit", "q"]
			}
		when "create"
			@question = "Is this a candidate or a voter?"
			@options =  "(P)olitician or (V)oter"
			@choices = {
				"politician" =>  ["politician", "p"],
				"voter" =>       ["voter", "v"]
			}
		when "update"
			@question = "Who would you like to update?"
			@options = (@database.candidate_names + @database.voter_names + ["(C)ancel"])
			@choices = {
				"updater" => (@database.candidate_names + @database.voter_names),
				"no" => ["cancel","c"]
			}
		when "delete"
			@question = "Who would you like to delete?"
			@options = (@database.candidate_names + @database.voter_names + ["(C)ancel"])
			@choices = {
				"confirm_delete" => (@database.candidate_names + @database.voter_names),
				"no" => ["cancel","c"]
			}
		when "confirm_delete"
			@question = "Are you sure?"
			@options =  "(Y)es, (N)o"
			@choices = {
				"yes_delete" =>  ["yes", "y"],
				"no" =>   ["no", "n"]
			}
		when "politician"
			@question = "Please enter the party of the candidate: "
			@options =  "(D)emocrat or (R)epublican"
			@choices = {
				"democrat" =>    ["democrat", "d"],
				"republican" =>  ["republican", "r"]
			}
		when "voter"
			@question = "Please enter the voter's politics: "
			@options =  "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist or (N)eutral"
			@choices = {
				"liberal" =>       ["liberal", "l"],
				"conservative" =>  ["conservative", "c"],
				"tea_party" =>     ["tea party", "t", "tp", "tea"],
				"socialist" =>     ["socialist", "s"],
				"neutral" =>       ["neutral", "n"]
			}
		end
	end
end
