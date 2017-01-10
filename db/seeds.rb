100.times do |post|
	Post.create!(date: Time.now, rationale: "This is Number #{post + 1}")
end 