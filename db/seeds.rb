Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  puts seed
  load seed
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
