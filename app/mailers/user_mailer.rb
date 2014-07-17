class UserMailer < ActionMailer::Base
  default from: "julie@bitmakerlabs.com"

  def welcome(user)
    @user = user
    @url = "http://localhost:3000/login"
    mail(to: @user.email, subject: 'Welcome to Crowdfunder!')
  end
end
