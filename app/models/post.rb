class Post < ActiveRecord::Base
	validates :image_url, uniqueness: true

	def activate
		self.active = true
		self.save
	end

	def self.populate
		all_instagrams = HTTParty.get("https://api.instagram.com/v1/tags/bostonsbad/media/recent?client_id=242df425470e4c3594a7d4111bc7cba5")
		all_instagrams["data"].each do |instagram|
			post = Post.create(image_url:"#{instagram["images"]["standard_resolution"]["url"]}",caption:"#{instagram["caption"]["text"]}",submitted_by:"#{instagram["user"]["username"]}")
			PostAcceptanceMailer.acceptance_mailer(post).deliver if post.save
		end
		Post.all
	end	
end
