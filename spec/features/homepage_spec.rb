require 'rails_helper'

describe 'Homepage Flow' do 
	describe 'Overtime approval' do
		it 'can approve an overtime request' do 
			admin = FactoryGirl.create(:admin_user)
			post = FactoryGirl.create(:post)
		 	login_as(admin,scope: :user)

			visit root_path
			click_on "approve_#{post.id}"
			expect(post.reload.status).to eq("approved")
		end 

	end 

end 