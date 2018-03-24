100.times do |post|
	Post.create!(created_at: Date.today, text: "#{post} text content")
end

puts "100 Posts have been created"