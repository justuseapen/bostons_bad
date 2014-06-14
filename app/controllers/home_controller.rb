class HomeController < ApplicationController
  def index
    @featured_instagrams = Instagram.user_recent_media("1350874038", {:count => 1})
  end
end
