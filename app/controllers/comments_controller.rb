class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.build(comment_params)
    @comment.user_id = current_user.id
    if @comments.save
    render  template: 'items/show'
    end
  end

private

  def comment_params
  params.require(:comment).permit(:text, :user_id, :item_id )
  end

end