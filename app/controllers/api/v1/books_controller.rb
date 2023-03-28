
module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_author

      def index
        books = @author.books
        render json: BookSerializer.new(books).serialized_json
      end

      def show
        book = @author.books.find(params[:id])
        render json: BookSerializer.new(book).serialized_json
      end

      def create
        book = @author.books.new(book_params)
        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def update
        book = @author.books.find(params[:id])
        if book.update(book_params)
          render json: book
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        book = @author.books.find(params[:id])
        book.destroy
        head :no_content
      end

      private

      def set_author
        @author = Author.find(params[:author_id])
      end

      def book_params
        params.require(:book).permit(:title, :description, :publication_date)
      end
    end
  end
end