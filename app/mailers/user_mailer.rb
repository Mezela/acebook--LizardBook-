class UserMailer < ApplicationMailer
  default from: "LizardTeam@LizardBook.com"

  def welcome_email
    @user = params[:user]
    @url = "http://localhost:3000/"
    mail(to: @user.email, subject: "Thank you for signing up to LizardBook!")
  end
end
