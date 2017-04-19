class UsersController < ApplicationController
  
  def new
  end

  def create
  	@newuser = User.new(user_params)
  	if User.exists?(name: params[:name])
  		@user = User.exists?(name: params[:name])
  		session[:user] = @user.id
   		redirect_to "/messages/#{@user.id}"
  	elsif @newuser
  		if @newuser.save 
  		  session[:user] = @newuser.id
  		  redirect_to "/messages/#{@newuser.id}"
  		else
  		  flash[:errors] = @newuser.errors.full_messages
  	 	  redirect_to "/users/new"
  	 	end 
  	else 
  		flash[:errors] = @user.errors
  	end
  end

  
   

  def destroy
  	session[:user] = nil 
  	redirect_to "/users/new"
  end

  private
  	def user_params
  	  params.require(:user).permit(:name)
  	end
end
