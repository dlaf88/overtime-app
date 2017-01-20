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
	end 
	factory :admin_user, class: "AdminUser" do 
		first_name "Admin"
		last_name "User"
		email {generate :email}
		password "admin-user"
		password_confirmation "admin-user"
	end 
	factory :user_2, class: "User" do
		first_name "Segundo"
		last_name "Acosta"
		email {generate :email}
		password "asdfasdf"
		password_confirmation "asdfasdf"
	end 
end 
