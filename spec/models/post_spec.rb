require 'rails_helper'

RSpec.describe Post, type: :model do
	before do 
 		user = User.create!(first_name: 'Charrito',last_name: 'Javier',email: 'asdfasdf@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf')	 
 		@post = Post.create(date: Time.now,rationale: 'This is the rationale.',user_id: user.id)
 	end 
  describe 'creation'do 	
  		it 'can be created'do  			 
  			expect(@post).to be_valid
  		end 

  		it 'cannot be created without a date or a rationale'do
  			@post.date,@post.rationale = nil
  			expect(@post).to_not be_valid
  		end 
	end    
end
