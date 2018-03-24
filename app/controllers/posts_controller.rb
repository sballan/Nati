class PostsController < ApplicationController
	# Do this method before the action 'show'
	before_action :set_post, only: [:show]

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
		
		if @post.save
			# Redirect to the show page for Post.  And pass along this cool (useless...) notice
			redirect_to @post, notice: 'Your post was created successfully'
		else
			render :new
		end
	end

	def show
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
