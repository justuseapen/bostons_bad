class HomeController < ApplicationController
  def index
  	Post.check_for_new
  	@posts = Post.where(active: true)
  end
end
