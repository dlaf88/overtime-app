require 'rails_helper'

RSpec.describe AuditLog, type: :model do
	 describe 'creation' do
	 	before do 
	 		@user = FactoryGirl.create(:user)
	 		@audit_log = FactoryGirl.create(:audit_log)
	 	end

	 	it 'can be created' do  		
	 		expect(@audit_log).to be_valid
	 	end 
	 end 
	 describe 'to be VALIDATED' do
	 	before do 
	 		@user = FactoryGirl.create(:user)
	 		@audit_log = FactoryGirl.create(:audit_log)
	 	end
	 	it 'must have a user' do 
	 		@audit_log.user_id = nil
	 		expect(@audit_log).to_not be_valid
	 	end 

	 	it 'must have a start date' do 
	 		@audit_log.start_date = nil
	 		expect(@audit_log).to_not be_valid
	 	end 

	 	it 'must have a status' do 
	 		@audit_log.status = nil
	 		expect(@audit_log).to_not be_valid
	 	end 

	 	it 'must have a start date that is exactly 6 days prior' do
	 		audit_log_2 = AuditLog.create!(user_id: User.last.id, status: 0 )
	 		expect(audit_log_2.start_date).to eq((Date.today - 6.days))
	 	end 

	 end 

end
