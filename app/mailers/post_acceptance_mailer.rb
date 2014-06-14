class PostAcceptanceMailer < ActionMailer::Base
  default from: "bot@bostonsbad.com"

  def acceptance_mailer(post)
  	@post = post
  	mail(to: "justuseapen@gmail.com", subject: "#{post.submitted_by} has submitted to #BostonsBad")
  end
end
