# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/signup
  def signup
    NotificationsMailer.signup(User.first)
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/item_added
  def item_added
    NotificationsMailer.item_added(Item.last)
  end

end
