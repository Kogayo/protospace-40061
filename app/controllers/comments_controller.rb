class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.create(comment_params)
    @comments = @prototype.comments

    if @comment.save
      @comments = @prototype.comments.reload
      redirect_to prototype_path(@prototype)
    else
      render 'prototypes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end
end