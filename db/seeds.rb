@user = User.create!(first_name: 'Charrito',last_name: 'Javier',email: 'asdfasdf@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf')
@second_user = User.create!(first_name: 'Segundo',last_name: 'Acosta',email: 'segundo@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf')
admin_user = AdminUser.create!(first_name: 'Admin',last_name: 'User',email: 'almedia@legal.com',password: 'asdfasdf',password_confirmation: 'asdfasdf')
50.times do |post|
	Post.create!(date: Time.now, rationale: "This is Number #{post + 1}",user_id: @user.id, overtime_request: 3.0)
end 
50.times do |post|
	Post.create!(date: Time.now, rationale: "Segundo's Post #{post + 1}",user_id: @second_user.id, overtime_request: 0.5)
end 