class PostAcceptanceMailer < ActionMailer::Base
  default from: "bot@bostonsbad.com"

  def acceptance_mailer(post)
  	@image_url = post.image_url
  	@caption = post.caption
  	@submitted_by = post.submitted_by
  	mail(to: "justuseapen@gmail.com", subject: "#{post.submitted_by} has submitted to #BostonsBad")
  end
end
