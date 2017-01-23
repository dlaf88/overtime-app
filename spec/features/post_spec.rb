require 'rails_helper'

describe 'Post' do 
	before do 
		@user = FactoryGirl.create(:user)
		login_as(@user,scope: :user)
	end 

	describe 'index' do
		before do 			
			@post1 = FactoryGirl.create(:post)
			@post1.update!(user_id: @user.id)
			post2 = FactoryGirl.create(:second_post)
			visit posts_path 
		end 		
		it 'has a list of Post' do 		
			expect(page).to have_content(@post1.rationale.to_s)
		end 		

	end 

	describe 'creation' do 
		before do			
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
	
	describe 'destroy' do 
		before do 
			
			@post1 = FactoryGirl.create(:post)	
			@post1.update!(user_id: @user.id)					 
		end 

		it 'can destroy a post by first going to index page' do
			visit root_path
			click_link 'posts_path'
			click_link "destroy_post_#{@post1.id}"
			expect(page.status_code).to eq(200)

		end 

	end 

	describe 'edit' do 
		before do		
			@post = FactoryGirl.create(:post)
			@post.update!(user_id: @user.id)
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

		it 'cannot be updated by non-post creator' do
			logout(:user)
			user_2 = FactoryGirl.create(:user_2)
			login_as(user_2, scope: :user)
			visit edit_post_path(@post)
			expect(current_path).to eq(root_path)
		end 
	end 

end 