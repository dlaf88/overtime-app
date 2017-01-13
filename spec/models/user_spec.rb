require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
      @user = User.create(email: 'asdf@asdf.com',password: 'asdfasdf',password_confirmation: 'asdfasdf',first_name: 'Diego',last_name:'Lafuente')
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
        expect(@user.full_name).to eq("Diego Lafuente")
      end 
  end
end
