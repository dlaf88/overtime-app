class StaticController < ApplicationController
	def homepage
		@pending_approval = Post.where(:status => 'submitted')
		
	end 
end 