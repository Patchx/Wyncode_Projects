# Property Manager Models
## Objectives
Students will be able to:
- build a database given an ERD(sticks and boxes)
- generate models from the command line
- create a “has many” and “belongs_to association between two models

##Description
In the same groups as the previous group work assignment students will now use the ERD that they created to generate a model from the command line. All group members will contribute to the app while one of the group members drives.

##Time
20-30 min

##Groups
Groups of two will be created by proximity in the room

##Prompt
Prompt:
Lets go back to our property manager app. We want now make the other models for the app so they match the ERD we designed in the previous exercise.

CD into the property_manager folder

install the `rails-erd` gem

We are going to use a gem called 'rails-erd' that generates a PDF document containing an Entity Relationship Diagram of your current database. Please check on the (detailed installation instructions).

Add Rails ERD as a plugin to your Ruby on Rails 4 application. In your Gemfile...

```
group :development do
  gem "rails-erd"
end
```

In the console:

`bundle install`

Generate your first diagram You now have a new Rake task in your application. Generate an up-to-date model diagram with...

`rake erd`

Done!

Now you have in your directory a ERD.pdf to view your diagram.

In the console:

`open erd.pdf`

At this point you should only have one table (Properties) in your database. Now we are going to generate the other models.

In the last exercise we created the columns of the table through migrations, but we can also do this quickly straight from the command line. Here's the syntax

`rails g model Landlord name`

Now we need to make sure that we have a place in the Properties table to give landlords ownership of each property.

Let's create a migration so the each property knows which landlord it belongs to. This time we are going to add the column directly from the command line

`rails g migration AddLandlordToProperties landlord_id:integer`

Let's go check the migration file to make sure we generated the correct migration. Does the change method look familiar? It's something we did manually in the last exercise.

If everything looks good, `rake db:migrate` and give the instructions to the database to make the appropriate change. Check the schema and we should see the association.

Great! The other model that needs o be generated is repairs. You are on your own for this one. Make sure to think about the relationship between and properties and repairs and what columns will be necessary in the repair model.

Once you have all your models generated and migrated properly

Run the rake erd command once again and open erd.pdf

Compare in your group the erd.pdf to your initial drawing, then compare it to your schema file.

##Assessment
Students will self assess based on the explanations given in their groups.
