class PostsController < ApplicationController
	before_filter :authorize, only: [:accept] 

	def new
		@post = Post.new
	end

	def create
		@post = Post.find(post_params)
		@post.save
	end

	def accept
		@post = Post.find(params[:id])
		if current_user.admin
			@post.activate
			redirect_to root_path
		else
			redirect_to sign_in_path
		end
	end

	private

	def post_params
		params.require(:post).permit(:image_url, :submitted_by, :caption)
	end
end
