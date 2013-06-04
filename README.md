Preliminary note: This project has nothing in common with TeX or LaTeX :) Sorry if you ended up there for that very reason.

## Introduction.

Here you'll find two very small demo projects developped for the
purpose of teaching ruby to non-developpers @ paris.rb's meetup. They
are together a very minimalistic implementation of something looking
like twitter. But you won't be posting tweet you, you'll be posting
tex. You can find here :

* A (rails) JSON api providing mainly two features: Posting tex and retrieving them.
* A (sinatra) client for the API, exposing the features of the API to the end-user.

## How to run them ?

### API server

The api server can be run very easily following the traditionnal rails procedure :

* `cd api` : Moves you into the 'api' folder.
* `bundle install` : Installs automagically all the dependencies required, thanks to Bundler.
* `rake db:migrate` : Creates the database
* `rails server` : Runs the rails application.

### Client

Here we're using sinatra, still with Bundler goodness :

* `bundle install` : Same as above.
* `ruby client.rb` : Runs the sinatra application.


