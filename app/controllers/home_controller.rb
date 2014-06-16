class HomeController < ApplicationController
  def index
  	Post.check_for_new
  	@posts = Post.active_posts
  end
end
