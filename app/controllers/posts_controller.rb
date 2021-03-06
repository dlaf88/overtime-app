class PostsController < ApplicationController
	before_action :set_post, only: [:show,:edit,:update,:destroy,:approve]
	
	def index 
		if current_user.is_a?(AdminUser) 
			@posts = Post.all.page(params[:page]).per(10)
		else 
			@posts = Post.posts_by(current_user).page(params[:page]).per(10)
		end 
	end 

	def approve
		authorize(@post)
		@post.approved!
		redirect_to root_path, notice: "Your Post has been approved."

	end 

	def edit
		authorize @post
	end 

	def destroy
		if @post.delete
			redirect_to action: :index, notice: "Your post has been successfully deleted."
		else
			render :index
		end 
	end 

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Your post has been successfully updated."
		else 
			flash[:alert] = "Something went wrong."			
			render :edit
		end 	
	end 

	def show
		
	end 
	def new
		@post = Post.new
	end 

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to @post,notice: 'Your post was created successfully.'
		else	
			flash.notice = "Something went wrong."	
			render :new
		end 
	end

	private
	 	
	def post_params
		params.require(:post).permit(:date,:rationale,:status,:overtime_request)
	end 
	def set_post
		@post = Post.find(params[:id])
	end 
end
