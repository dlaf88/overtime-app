@user = User.create!(first_name: 'Charrito',last_name: 'Javier',email: 'asdfasdf@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf')

100.times do |post|
	Post.create!(date: Time.now, rationale: "This is Number #{post + 1}",user_id: @user.id)
end 