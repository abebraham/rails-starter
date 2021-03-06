# README

Description: This is a simple Rails starter application for prototyping with the following tools

* Server: AWS Elastic Beanstalk
* Database: postgreSQL
* Payments: [Stripe](https://stripe.com/docs/checkout/rails)
* Authentication: [Devise](http://devise.plataformatec.com.br/)
* Frontend: [Tailwinds CSS](https://tailwindcss.com/)
    * Icons: [Fontawesome](https://fontawesome.com/)
    * Carousel: [Slick.JS](http://kenwheeler.github.io/slick/)
    * Clipboard: [Clipboard.JS](https://clipboardjs.com/)
    * Checkbox/Radio: [Pretty Checkbox](https://lokesh-coder.github.io/pretty-checkbox/) 
* Analytics:
    * [Ahoy](https://github.com/ankane/ahoy.js)
    * [Blazer](https://github.com/ankane/blazer)
    * [Groupdate](https://github.com/ankane/groupdate)
    * [Chartkick](https://www.chartkick.com/)
* Email: AWS SES

## Setting up EB Environment

- Create new EB Application
    - Go to your Rails-starter repo in your machine
    - run `eb init -i`
    - Select Yes to adding CodeCommit Repo
    - select option `3) Ruby 2.4 (Puma)`
- Create a new Enviornment
    - Select Application Code with Exisiting Version, select previously created source code (code commit)
    - Select _Configure more options_ at the bottom
        - Select _Modify_ in the Software section and add the following envrionment variabls
            - RAILS_SERVE_STATIC_FILES (set as true)
            - ADMIN_EMAIL
            - ADMIN_PASS
            - DEVISE_SECRET_KEY (run `rails secret`)
            - SECRET_KEY_BASE (run `rails secret`)
            - SES_SMTP_PASSWORD
            - SES_SMTP_USERNAME
            - FACEBOOK_APP_ID
            - FACEBOOK_SECRET_KEY
            - TWITTER_APP_ID
            - TWITTER_SECRET_KEY
        - Select _Modify_ Databse to create Postgres DB
            - select Engine Version: 9.6.6
            - create username and password (Abrahamloves+dbadmin)
        - Select _Create environment_ at the bottom




## Cloning Repo

* Clone the repo using the following command run `git clone <directory url> <directory name>`

* Delete the current git connect with `rm -rf .git/`

* run `bundle update && bundle install`

* run `npm install` (maybe not needed)

* run `yarn install`

* Change the name of the application [follow these instructions](https://stackoverflow.com/questions/42326432/how-to-rename-a-rails-5-application)

## AWS Elastic Beanstalk

* run `eb init`

* run `eb create`
    * Look into [`eb create db...`](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-create.html)

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

#### Set up environment variables
* Some of these are already ready preconfigured
```
BUNDLE_WITHOUT = <test:development>
DEVISE_SECRET_KEY = <Long string>
RACK_ENV = production
RAILS_SERVE_STATIC_FILES = true
RAILS_SKIP_ASSET_COMPILATION = false
RAILS_SKIP_MIGRATIONS = false
SECRET_KEY_BASE = <long string | view command below>
SES_SMTP_PASSWORD = < unique Password >
SES_SMTP_USERNAME = < unique Username >
```

* run `eb setenv SECRET_KEY_BASE=$(rails secret)`

* run `RAILS_ENV=production bundle exec rake assets:precompile`

* Make sure to run `git add . && git commit -m "getting ready for aws eb"`

* run `eb deploy`

#### Useful EB commands

* Run `eb printenv` to view environment variables

* Run `eb setenv CONSTANT="String or boolean"` to set environment variables

## Devise

#### Getting Started

* Run `Bundle update && bundle install`

* Run `rails generate devise:install`

* To be able to customize devise views run the following: `rails g devise:views`

* Add the following to `config/environments/development.rb`
	- `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`

* Run `rails generate devise MODEL` (usually using User)

* Run `rails generate controller Users`

* Run `rails db:migrate`

#### Working with Devise

* Add new attribute to (User) model
	* Run `rails g migration addNameToUsers name:string`

* Edit registration (sign up) via parameters
	* `app/controllers/registrations_controller.rb`

* Edit devise views `app/views/devise/*`

## Email | AWS SES

#### Setup
* Adding Email Address following this [guide](https://www.sitepoint.com/deliver-the-mail-with-amazon-ses-and-rails/)

* Next create your SMTP Credentials

* Added SMTP Username and SMTP Password to environemnt
	* `eb setenv SES_SMTP_USERNAME=<username>`
	* `eb setenv SES_SMTP_PASSWORD=<password>`

* Change `# EMAIL CONFIGURATIONS` found in `production.rb` and `development.rb`
	* Note for `development.rb` you may need to create a Google password app
	* For `production.rb` use the specific Elastic Beanstalk Instance information

* Change the following from `devise.rb`
	* `config.mailer_sender = <email that is accepted by AWS SES>` 

* When ready you will have to get out of the AWS SES Sandbox

* Change the _from_ email in the `user_mailer.rb`
``` ruby
def user_welcome(user)
    @email = user.email
    @name = user.name
    subject = "Thanks for Joining RailsStarter"
    from = "email@example.com"
    mail(to: @email, subject: subject, from: from)
end
```

* Run `git add .` then `git commit -m ""` then `eb deploy`

#### Create Email Redirect
* Create a SNS Topic
* [Instructions for Lambda](https://medium.com/@ashan.fernando/forwarding-emails-to-your-inbox-using-amazon-ses-2d261d60e417)

#### Setting up NameCheap DKIM
* Follow this [instructions](https://blog.lunchbunch.me/aws-ses-domain-verification)

#### Edit Email Views
* For most Devise related Email Views edit in `appview/devise/mailer*`
* For successful Registration email view `registrations_controller.rb`

## Active Admin
#### Getting Started
* Run `rails g active_admin:install`

* Run `rails db:migrate`

* Run `rails db:seed`

* Solution if Active:admin error [Look her](https://github.com/activeadmin/activeadmin/blob/d9582f33f3c76bac04373f21c25b4efd2be90e65/docs/0-installation.md#will_paginate)

## Ahoy
* Details for Ahoy

## Blazer
* ENV["BLAZER_DATABASE_URL"] = "postgres://user:password@hostname:5432/database"

* Contains many query examples to use: https://blazer.dokkuapp.com/queries/15-map

## Omniauth
### Facebook
* Create an application using https://developer.facebook.com

* Change the enviornment variables for Facebook API ID and Facebook Secret Key

### Twitter
* Do the tame as for facebook

* For development you _must_ use 127.0.0.1 instead of localhost

