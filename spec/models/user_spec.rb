require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
      @user = FactoryGirl.create(:user)
    end
  describe 'creation' do  	 
  	it 'can be created' do   		
  		expect(@user).to be_valid
  	end 
  	it 'is not valid if first_name or last_name is nil' do 
  		@user.first_name = nil
  		@user.last_name = nil
  		expect(@user).to_not be_valid
  	end 
  end 
  describe 'custom name methods' do 
      it 'has a full last name' do
        expect(@user.full_name).to eq("Charrito Javier")
      end 
  end
end
