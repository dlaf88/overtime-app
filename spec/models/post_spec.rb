require 'rails_helper'

RSpec.describe Post, type: :model do
	before do 
 		user = FactoryGirl.create(:user)
 		@post = FactoryGirl.create(:post)
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
