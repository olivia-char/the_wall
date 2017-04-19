class CommentsController < ApplicationController
  def new
  end

  def create
  	@users = User.find_by(id: session[:user])
  	@comment = Comment.new(comment_params)

  	if @comment.save
  		redirect_to "/messages/#{@users.id}"
  	else
  		flash[:errors] = @comment.errors.full_message
  		redirect_to "/messages/#{@users.id}"
  	end 
  end

  private 
  	def comment_params
  		params.require(:comment).permit(:comment).merge(user: User.find(session[:user]),message: Message.find(params[:id]))
  	end
end
