class BookCommentsController < ApplicationController

  def create
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = Book.find(params[:book_id]).id
    comment.save
    redirect_to book_path(comment.book_id)
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
