class PasswordResetsController < ApplicationController
  def new
  	
  end

  def create
  	chef=Chef.find_by_email(params[:email])
  	chef.send_password_reset if chef
  	flash[:success]="Email sent with password reset instructions"
  	redirect_to root_path
  end
end
