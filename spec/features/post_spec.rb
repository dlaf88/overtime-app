require 'rails_helper'

describe 'Post' do 

	describe 'index' do
		it 'can be successfully reached' do 
			visit posts_path 
			expect(page.status_code).to eq(200)
		end 
	end 

end 