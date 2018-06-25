AdminUser.create!(email: 'admin@example.com', 
									password: 'password', 
									password_confirmation: 'password') if Rails.env.development?

AdminUser.create!(email: ENV["ADMIN_EMAIL"],
									password: ENV["ADMIN_PASS"],
									password_confirmation: ENV["ADMIN_PASS"]) if Rails.env.production?