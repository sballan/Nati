class PostsController < ApplicationController
	# Do this method before the action 'show'
	before_action :set_post, only: [:show]

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
