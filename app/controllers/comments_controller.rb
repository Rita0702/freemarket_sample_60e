class CommentsController < ApplicationController
  def create
      @comment = Comment.new(comment_params)
    if @comment.comment.present?
      @comment.save
      redirect_to product_path(@comment.product.id)
    else
      redirect_to product_path(@comment.product.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(product_id:params[:product_id],user_id: current_user.id)
  end
end