class UserMailer < ApplicationMailer

	def user_welcome(user)
		@email = user.email
		@name = user.name
    mail (
			to: @email, 
			subject: "Thanks for Joining Flagupmail",
			from: "hello@website.com"
    )
	end
end
