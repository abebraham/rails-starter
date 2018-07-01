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

if Rails.end.development?
	50.times do |i|
		User.create!(name: Faker::Name.name,
								 email: Faker::Internet.email,
								 password: 'password',
								 password_confirmation: 'password')
	end
end