# Preview all emails at http://localhost:3000/rails/mailers/shop_user_mailer
class ShopUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/shop_user_mailer/account_activation
  def account_activation
    ShopUserMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/shop_user_mailer/password_reset
  def password_reset
    ShopUserMailer.password_reset
  end

end
