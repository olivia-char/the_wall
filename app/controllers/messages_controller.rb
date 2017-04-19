class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  	@users = User.find_by(id: session[:user])
  	@comments = Comment.all
  end

  def new
  end

  def create
  	@users = User.find_by(id: session[:user])
  	@message = Message.new(message_params)

  	if @message.save 
  		redirect_to "/messages/#{@users.id}"
  	else 
  		flash[:errors] = @message.errors.full_messages
  		redirect_to "/messages/#{@users.id}"
  	end
  end

  private
 	def message_params
 		params.require(:message).permit(:message).merge(user: User.find(session[:user]))
 	end
end
