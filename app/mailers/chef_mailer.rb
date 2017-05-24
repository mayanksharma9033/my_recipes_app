class ChefMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chef_mailer.password_reset.subject
  #
  def password_reset(chef)
  @chef=chef
  mail :to=>chef.email, :subject=>"Password Reset"
  end
end
