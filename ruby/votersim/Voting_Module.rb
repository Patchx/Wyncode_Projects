# For use with the voter simulation assignment - Wyncode 2016

# ---- Modules ----
module Voting_Model
	# Connects to the database class
	class Entity
		attr_accessor :name
		@@total_entities = 0 # Tracks sum of all entity and inheirited-type objects
		def initialize(name)
			@@total_entities += 1
			@created = Time.now # Added for future sorting functions
			@entity_num = @@total_entities
			@name = name
		end
	end

	class Politician < Entity
		attr_accessor :name, :party
		@@total_num = 0
		def initialize(name, party)
			@party = party
			super(name)
		end
	end

	class Voter < Entity
		attr_accessor :name, :politics
		@@total_num = 0
		def initialize(name, politics)
			@politics = politics
			super(name)
		end
	end
end

