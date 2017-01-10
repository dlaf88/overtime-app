require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation'do
 	before do 
 		@post = Post.create(date: Time.now,rationale: 'This is the rationale.')
 	end 
  		it 'can be created'do  			 
  			expect(@post).to be_valid
  		end 

  		it 'cannot be created without a date or a rationale'do
  			@post.date,@post.rationale = nil
  			expect(@post).to_not be_valid
  		end 
	end 
end
