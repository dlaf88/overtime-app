require 'rails_helper'

describe 'Homepage Flow' do 
	describe 'Overtime approval:' do
		it ' An Admin can approve an overtime request' do 
			admin = FactoryGirl.create(:admin_user)
			post = FactoryGirl.create(:post)
		 	login_as(admin,scope: :user)

			visit root_path
			click_on "approve_#{post.id}"
			expect(post.reload.status).to eq("approved")
		end 

		it 'An Employee can cofirm an audit log' do 
			user = FactoryGirl.create(:user)
			audit_log = FactoryGirl.create(:audit_log)
			audit_log.update(user_id: user.id)
			login_as(user,scope: :user)

			visit root_path
			click_on "confirm_audit_#{audit_log.id}"
			expect(audit_log.reload.status).to eq("confirmed")

		end 

	end 

end 