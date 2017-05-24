class LoginsController < ApplicationController

	def new
   
	end

	def create
     chef=Chef.find_by(email: params[:email])
     if chef && chef.authenticate(params[:password])
       if params[:remember_me]
          cookies.permanent[:auth_token]=chef.auth_token
      else
          cookies[:auth_token]=chef.auth_token
     end
     	session[:chef_id]=chef.id
     	flash[:success]="you are logged in"
     	redirect_to recipes_path
     else
     	flash.now[:danger]="Your email address and passsword are incorrect"
     	render 'new'
     end
     
	end

	def destroy
		session[:chef_id]=nil
          cookies.delete(:auth_token)
		flash[:success]="you have logged out"
		redirect_to root_path
	end

end