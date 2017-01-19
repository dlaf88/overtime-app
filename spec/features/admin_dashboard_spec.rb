require 'rails_helper'

describe 'Admin Dashboard'do 
	before do 
		visit root_path
	end 
	describe 'navigate' do 
		it 'can be reached only if user is logged in' do 			
			visit admin_root_path
			expect(current_path).to_not eq(admin_root_path)
		end 

		it 'can not be reached by non-admin users' do
			user = FactoryGirl.create(:user)
			login_as user,scope: :user
			visit admin_root_path 
			expect(current_path).to_not eq(admin_root_path)
		end 

		it 'can be reached by an admin user' do
			admin_user = FactoryGirl.create(:admin_user)
			login_as admin_user,scope: :user
			visit admin_root_path 
			expect(current_path).to eq(admin_root_path)
		end
	end 
end 