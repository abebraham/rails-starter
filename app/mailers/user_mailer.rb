class UserMailer < ApplicationMailer

	def user_welcome(user)
		@email = user.email
		@name = user.name
		subject = "Thanks for Joining RailsStarter"
		from = "hello@railsstarter.com"
    mail(to: @email, subject: subject, from: from)
	end
end
