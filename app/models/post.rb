class Post < ActiveRecord::Base
	validates :image_url, uniqueness: true
	scope :active_posts, -> { where(active: true).order(created_at: :desc) }

	def activate
		self.active = true
		self.save
	end

	def self.check_for_new
		all_instagrams = HTTParty.get("https://api.instagram.com/v1/tags/bostonsbad/media/recent?client_id=#{ENV["INSTAGRAM_CLIENT_ID"]}")
		if all_instagrams.code == 200
			all_instagrams["data"].each do |instagram|
				post = Post.create(image_url:"#{instagram["images"]["standard_resolution"]["url"]}",caption:"#{instagram["caption"]["text"]}",submitted_by:"#{instagram["user"]["username"]}")
				PostAcceptanceMailer.acceptance_mailer(post).deliver if post.save
			end
		else
			redirect_to root_url
		end
		Post.all
  end	
end
