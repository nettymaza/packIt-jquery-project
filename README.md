# Rails Pack-it with JQuery Front-end!

Pack-it is app intended to help you manage your trips. Once you sign up for an account, you can create trips, add items to your packing list and when finished mark a specific trip as complete. Your Trips page allows you the option of filtering which trips your are viewing by "Past" and "Upcoming".

## Installation

Ruby version:

`ruby 2.4.3p205`

Please make sure to install homebrew, follow instructions from this link https://docs.brew.sh/Installation.html

To install sqlite3 `brew install sqlite`

And then execute:

`bundle install`

Create the database:

`rake db:create`

To run migrations:

`rake db:migrate`

To seed data:

`rake db:seed`

## Running Application

To run this application run `rails server` from the command line, open browser and type localhost:0000 and use port of choice.

## Contributing

The app is available as open source under the terms of the <a href="https://opensource.org/licenses/MIT">MIT License</a>

Bug reports and pull requests are welcome on GitHub at https://github.com/nettymaza/packIt-rails-project.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the <a href="https://www.contributor-covenant.org/">Contributor Covenant</a> code of conduct.
