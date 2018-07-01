class Address < ApplicationRecord
	belongs_to :user

	def full_address
		return "#{self.line1} #{self.line2}, #{self.city}, #{self.state} #{self.zip}"
	end
end
