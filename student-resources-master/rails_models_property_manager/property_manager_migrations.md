#Property Manager Migrations
##Objectives
Students will be able to:
- generate an empty migration, then add, remove, change, and rename a column of a model.
- describe the effects of migrations on a database by reading and interpreting a schema.rb file.

##Description
At this point students will have already created a simple rails app named property manger with some has_many and belongs to relationships. Now we are going to ask them to create some migrations fro this project.

#Time
20-30 min

##Prompt
Create a new rails app named property_manager

CD into the property_manager folder

Open the app in your text editor using `atom .`

Once we have that open, lets go back to the terminal and generate a property model.

`rails g model Property`

We realize that we want to add some fields to our properties table to include a location and a rent for every property that a landlord owns, however we have already generated the model. So now we must learn how to make changes to a model that already exists.

The first thing we want to do it add a "location" field, so from the command line we are going to run and empty migration with proper naming conventions

`rails migrate AddLocationToProperties`

once have generated this we should be able to see a new migration in our text editor under config/db/migrations.

open that migration and we see and empty method in there named change

now we have to write the instructions for what we want the database to do

```
def change
  add_column :properties, :location, :string
  add_column :properties, :rent, :string
end
```

if we take a look at our schema.rb we will notice that nothing has changed yet though.

Right we wrote the instructions, we just haven’t actually given them to the database yet.

so from the terminal now we run

`rake:db migrate`

now lets go back and look at our schema.rb file, the properties table should now have city and rent fields that are both strings

also we can check from our rails console by running:

`Property.column_names`

Great now we have made our first migration and changed a field.

Oh no, but now we realize that we made a mistake, I don’t want the attribute to be a "location" I want to call it "city". Time to create another migration.

`rails migrate RenameLocationToCity`

go into our migration and rename the location attribute to city

```
def change
  rename_column :properties, :location, :city
end
```

`rake db:migrate` and check our schema.rb

Did the column rename successfully?

Oops! We just realized that we made another mistake when we created the rent column of the properties table, we made the column a string when we should have made it an integer.

lets make that change…

Create the migration on your own this time… here is the syntax for changing a column

```
def change
  change_column :properties, :rent, :integer
end
```

check the schema.rb

last one… we changed our minds and we don’t want to have the rent column at all, on your own, look up the syntax and create the migration to remove the rent column.

Check our schema, did it work?
