class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
    @book_comments = BookComment.all
    @book_comment = BookComment.new
  end

  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    @book_comments = BookComment.all
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id])
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end
