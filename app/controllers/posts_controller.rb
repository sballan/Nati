class PostsController < ApplicationController
	# Do this method before the actions 'show', 'edit', and 'update'
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	# The view for making a new post.
	def new
		@post = Post.new
	end

	# Actually make the post 
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id # current_user is given to us from devise
		if @post.save
			# Redirect to the show page for Post.  And pass along this cool (useless...) notice
			redirect_to @post, notice: 'Your post was created successfully'
		else
			render :new
		end
	end

	def edit;	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: 'Your post was updated successfully'
		else 
			render :edit
		end
	end

	def show;	end

	def destroy
		@post.delete
		redirect_to posts_path, notice: 'Your post was delete successfully'
	end

	private

		def post_params
			params.require(:post).permit(:created_at, :text)
		end

		# This is called in a before action at the top of this file
		def set_post
			@post = Post.find(params[:id])
		end
end
