if Rails.env.development? && !AdminUser.find_by(email: "admin@example.com")
	AdminUser.create!(email: 'admin@example.com', 
										password: 'password', 
										password_confirmation: 'password') 
end

if Rails.env.production? && !AdminUser.find_by(email: ENV["ADMIN_EMAIL"])
	AdminUser.create!(email: ENV["ADMIN_EMAIL"],
										password: ENV["ADMIN_PASS"],
										password_confirmation: ENV["ADMIN_PASS"])
end

if Rails.env.development?
	50.times do |i|
		user = User.create!(name: Faker::Name.name,
								 email: Faker::Internet.email,
								 password: 'password',
								 password_confirmation: 'password')
		user.addresses.create!(
				line1: Faker::Address.street_address,
				line2: Faker::Address.secondary_address,
				city: Faker::Address.city,
				state: Faker::Address.state_abbr,
				zip: Faker::Address.zip
			)
	end
end