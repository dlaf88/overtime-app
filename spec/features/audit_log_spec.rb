require 'rails_helper'

 describe 'Audit Log Features:' do 
 	before do 
		@admin_user = FactoryGirl.create(:admin_user)
		@audit_log = FactoryGirl.create(:audit_log)
		login_as(@admin_user,scope: :user)
 	end 
 	describe 'index:' do 
 		before do 		
 			visit audit_logs_path

 		end 
 		it 'page can be reached.' do 			
 			expect(page.status_code).to eq(200)
 		end 
 		it 'audit_logs are displayed' do 
 			expect(page).to have_content(@audit_log.start_date)
 		end 
 		it 'audit log can be accessed only by admins' do
 			logout(:user)
 			user = FactoryGirl.create(:user)
 			login_as(user,scope: :user)
 			visit audit_logs_path

 			expect(current_path).to eq(root_path)
 		end 


 	end 
 	describe 'show:' do 

 		it 'audit log can be viewed.' do
 			visit audit_log_path(@audit_log)
 			expect(page).to have_content(@audit_log.start_date)
 		end 
 		it 'audit log can be accessed only by admins' do
 			logout(:user)
 			user = FactoryGirl.create(:user)
 			login_as(user,scope: :user)
 			visit audit_log_path(@audit_log)

 			expect(current_path).to eq(root_path)
 		end 

 	end 
 end 


