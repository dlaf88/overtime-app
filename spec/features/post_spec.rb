require 'rails_helper'

describe 'Post' do 

	describe 'index' do
		before do 
			user = User.create!(first_name: 'Charrito',last_name: 'Javier',email: 'asdfasdf@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf')
			login_as(user,scope: :user)
			visit posts_path 
		end 
		it 'can be successfully reached' do			
			expect(page.status_code).to eq(200)
		end 
		it 'contains the word Post' do 			
			expect(page).to have_content(/Posts/)
		end 
	end 

	describe 'creation' do 
		before do
			user = User.create!(first_name: 'Charrito',last_name: 'Javier',email: 'asdfasdf@gmail.com',password: 'asdfasdf',password_confirmation: 'asdfasdf')
			login_as(user,scope: :user)
			visit new_post_path 
		end 
		it 'can reach a new form' do 			
			expect(page.status_code).to eq(200)
		end 
		it 'can be created through form' do			
			fill_in 'post[date]',with: Date.today
			fill_in 'post[rationale]',with: 'Some rationale.'
			click_on "Save"
			expect(page).to have_content(/Some rationale./)
		end 
		it 'has a User associated with it' do
			fill_in 'post[date]',with: Date.today
			fill_in 'post[rationale]',with: 'This is it.'
			click_on "Save"
			expect(User.last.posts.last.rationale).to have_content(/This is it./)
		end 
	end

end 