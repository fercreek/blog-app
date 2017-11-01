class Auth::UserMailer < ApplicationMailer
  def register_email(user)
    @user = user
    mail(to: user.email, subjet: "welcome to the site")
  end
end
