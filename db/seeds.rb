@user = User.create!(first_name: 'Charrito',last_name: 'Javier',email: 'asdfasdf@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf',phone_number: "1234567890")
@second_user = User.create!(first_name: 'Segundo',last_name: 'Acosta',email: 'segundo@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf',phone_number: "1234567891")
admin_user = AdminUser.create!(first_name: 'Admin',last_name: 'User',email: 'almedia@legal.com',password: 'asdfasdf',password_confirmation: 'asdfasdf',phone_number: "1234567892")
50.times do |post|
	Post.create!(date: Time.now, rationale: "This is Number #{post + 1}",user_id: @user.id, overtime_request: 3.0)
end 
50.times do |post|
	Post.create!(date: Time.now, rationale: "Segundo's Post #{post + 1}",user_id: @second_user.id, overtime_request: 0.5)
end 

20.times do |log|
	AuditLog.create!(user_id: @second_user.id,status: 0,start_date: (Date.today - 6.days))
end 
20.times do |log|
	AuditLog.create!(user_id: @user.id,status: 0,start_date: (Date.today - 6.days))
end 