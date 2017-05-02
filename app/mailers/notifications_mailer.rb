class NotificationsMailer < ApplicationMailer
  default from: "hello@yardsale.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.signup.subject
  #
  def signup(user_that_just_signed_up)
    mail to: user_that_just_signed_up.email,
         subject: "You signed up for YardSale"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.item_added.subject
  #
  def item_added(item)
    @item = item

    mail subject: "New item available!",
         to: "nobody@yardsale.com",
         bcc: User.all.pluck(:email)
  end
end
