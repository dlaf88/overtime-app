FactoryGirl.define do 
	sequence :email do |n|
		"person#{n}@test.com"
	end 
	factory :user do 
		first_name "Charrito"
		last_name "Javier"
		email {generate :email}
		password "asdfasdf"
		password_confirmation "asdfasdf"
		phone_number "1234567890"
	end 
	factory :admin_user, class: "AdminUser" do 
		first_name "Admin"
		last_name "User"
		email {generate :email}
		password "admin-user"
		password_confirmation "admin-user"
		phone_number "1234567891"
	end 
	factory :user_2, class: "User" do
		first_name "Segundo"
		last_name "Acosta"
		email {generate :email}
		password "asdfasdf"
		password_confirmation "asdfasdf"
		phone_number "1234567892"
	end 
end 
