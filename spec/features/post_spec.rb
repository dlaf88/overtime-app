require 'rails_helper'

describe 'Post' do 

	describe 'index' do
		before do 
			user = FactoryGirl.create(:user)
			login_as(user,scope: :user)
			post1 = FactoryGirl.create(:post)
			post2 = FactoryGirl.create(:second_post)
			visit posts_path 
		end 
		it 'can be successfully reached' do			
			expect(page.status_code).to eq(200)
		end 
		it 'contains the word Post' do 			
			expect(page).to have_content(/Posts/)
		end 
		it 'has a list of Post' do 
			expect(page).to have_content(/some rationale|other rationale/)
		end 		
	end 

	describe 'creation' do 
		before do
			user = FactoryGirl.create(:user)
			login_as(user,scope: :user)
			visit new_post_path 
		end 
		it 'can reach a new form' do 			
			expect(page.status_code).to eq(200)
		end 

		it 'can reach a new form through the index page' do 
			visit root_path
			click_link 'new_post_nav_bar'
			expect(page).to have_content('New Post.')
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

	describe 'edit' do 
		before do 
			user = FactoryGirl.create(:user)
			login_as(user,scope: :user)
			@post = FactoryGirl.create(:post)
			visit posts_path
		end 
		it 'can be reached via the index page' do			
			click_link "edit_#{@post.id}"
			expect(page.status_code).to eq(200)

		end 
		it 'can update the post successfully' do 
			click_link "edit_#{@post.id}"
			fill_in 'post[rationale]',with: "This is it."
			click_on "Save"
			expect(page).to have_content(/This is it./)
		end 
	end 

end 