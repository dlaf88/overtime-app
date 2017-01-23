FactoryGirl.define do 
	factory :post do 
		date Date.today
		rationale 'Some rationale'
		user #this is the association for association validation
		overtime_request 3.0
	end 

	factory :second_post, class: "Post" do 
		date Date.today
		rationale "Some other rationale"
		user
		overtime_request 1.5		
	end 
end 