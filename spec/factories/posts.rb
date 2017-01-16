FactoryGirl.define do 
	factory :post do 
		date Date.today
		rationale 'Some rationale'
		user #this is the association for association validation
	end 

	factory :second_post, class: "Post" do 
		date Date.today
		rationale "Some other rationale"
		user
	end 
end 