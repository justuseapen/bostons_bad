class HomeController < ApplicationController
  def index
  	Post.populate
  	@posts = Post.where(active: true)
  end
end
