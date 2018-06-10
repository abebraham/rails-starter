class StaticPagesController < ApplicationController

	def home
		@title = "Home Page"
		@desc = "description of website"
	end

	def help
		@title = "Help Page"
		@desc = "description of website"
	end

	def about
		@title = "About Page"
		@desc = "description of website"
	end
end
