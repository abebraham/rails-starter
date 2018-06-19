# README

Description: This is a simple Rails starter application for prototyping with the following tools

* Database: postgreSQL
* Payments: [Stripe](https://stripe.com/docs/checkout/rails)
* Authentication: [Devise](http://devise.plataformatec.com.br/)
* Frontend: [Tailwinds CSS](https://tailwindcss.com/)
    * Icons: [Fontawesome](https://fontawesome.com/)
    * Carousel: [Slick.JS](http://kenwheeler.github.io/slick/)
    * Clipboard: [Clipboard.JS](https://clipboardjs.com/)
    * Checkbox/Radio: [Pretty Checkbox](https://lokesh-coder.github.io/pretty-checkbox/) 
* Analytics: 
*  

## Getting Started

* Clone the repo using the following command run `git clone <directory url> <directory name>`

* Delete the current git connect with `rm -rf .git/`

* run `bundle update && bundle install`

* run `npm install` (maybe not needed)

* run `yarn install`

* Change the name of the application [follow these instructions](https://stackoverflow.com/questions/42326432/how-to-rename-a-rails-5-application)

## AWS Elastic Beanstalk

* run `eb init`

* run `eb create`

* Run in root directory `mkdir .ebextensions`
    - Create `.ebextensions/db.config` with the following yaml content:
    ```bash
    packages:
      yum:
        postgresql93-devel: []

    ```
    - Create `.ebextensions/yarn.config` with the following content:
    ```bash
    commands:
      01_install_yarn:
        command: "sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo && curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash - && sudo yum install yarn -y"
      02_download_nodejs:
        command: curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
      03_install_nodejs:
        command: yum -y install nodejs
    ```

* Go into AWS Console and create postgreSQL db within Elastic Beanstalk. Do _not_ use username: Admin!
    - Go into your environment > configurations > database 

* run `eb setenv SECRET_KEY_BASE=$(rails secret)`

* run `RAILS_ENV=production bundle exec rake assets:precompile`

* Make sure to run `git add . && git commit -m "getting ready for aws eb"`

* run `eb deploy`

### Useful EB commands

* Run `eb printenv` to view environment variables

* Run `eb setenv CONSTANT="String or boolean"` to set environment variables

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
