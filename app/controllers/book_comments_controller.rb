class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    puts "**********************************************"
    puts @book_comments = BookComment.where(book_id: @book.id)
    puts "**********************************************"
    @book_comments = BookComment.where(book_id: @book.id)
    # @book_comment = BookComment.new
  end

  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    @book_comments = BookComment.all
    @book = Book.find(params[:book_id])
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end
