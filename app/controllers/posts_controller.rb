class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.find(post_params)
		@post.save
	end

	private

	def post_params
		params.require(:post).permit(:image_url, :submitted_by, :caption)
	end
end
