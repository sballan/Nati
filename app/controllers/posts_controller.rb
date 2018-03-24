class PostsController < ApplicationController
	def index
	end

	# The view for making a new post.
	def new
		@post = Post.new
	end

	# Actually make the post 
	def create
		# When the form is submitted, we get it's id in params.
		@post = Post.new(params.require(:post).permit(:created_at, :text))
		@post.save

		# Redirect to the show page for Post
		redirect_to @post
	end

	def show
		@post = Post.find(params[:id])
	end
end
