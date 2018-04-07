@user = User.create(
	email: 'asdf@asdf.com', 
	password: 'asdfasdf', 
	password_confirmation: 'asdfasdf', 
	first_name: 'James',
	last_name: 'Giant Peach'
)

puts "1 User created"

10.times do |post|
	Post.create!(created_at: Date.today, text: "#{post} text content", user_id: @user.id)
end

puts "100 Posts have been created"