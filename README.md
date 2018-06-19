# README

Description: This is a simple Rails starter application for prototyping

## Getting Started

* Clone the repo using the following command run `git clone <directory url> <directory name>`

* Delete the current git connect with `rm -rf .git/`

* run `bundle update && bundle install`

* run `npm install` (maybe not needed)

* run `yarn install`

* Change the name of the application [follow these instructions](https://stackoverflow.com/questions/42326432/how-to-rename-a-rails-5-application)

## Devise

### Getting Started

* Run `Bundle update && bundle install`

* Run `rails generate devise:install`

* To be able to customize devise views run the following: `rails g devise:views`

* Add the following to `config/environments/development.rb`
	- `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`

* Run `rails generate devise MODEL` (usually using User)

* Run `rails generate controller Users`

* Run `rails db:migrate`

### Working with Devise

* Add new attribute to (User) model
	* Run `rails g migration addNameToUsers name:string`

* Edit registration (sign up) via parameters
	* `app/controllers/registrations_controller.rb`

* Edit devise views `app/views/devise/*`


## Version

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
