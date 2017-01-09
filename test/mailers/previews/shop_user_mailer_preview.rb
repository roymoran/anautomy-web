# Preview all emails at http://localhost:3000/rails/mailers/shop_user_mailer
class ShopUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/shop_user_mailer/account_activation
  def account_activation
    shop_user = ShopUser.first
    shop_user.activation_token = ShopUser.new_token
    ShopUserMailer.account_activation(shop_user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/shop_user_mailer/password_reset
  def password_reset
    ShopUserMailer.password_reset
  end

end
