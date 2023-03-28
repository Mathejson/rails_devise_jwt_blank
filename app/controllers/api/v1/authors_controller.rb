# app/controllers/api/v1/authors_controller.rb
module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        authors = Author.all
        render json: AuthorSerializer.new(authors).serialized_json
      end

      def show
        author = Author.find(params[:id])
        render json: AuthorSerializer.new(author).serialized_json
      end

      def create
        author = Author.new(author_params)
        if author.save
          render json: author, status: :created
        else
          render json: author.errors, status: :unprocessable_entity
        end
      end

      def update
        author = Author.find(params[:id])
        if author.update(author_params)
          render json: author
        else
          render json: author.errors, status: :unprocessable_entity
        end
      end

      def destroy
        author = Author.find(params[:id])
        author.destroy
        head :no_content
      end

      private

      def author_params
        params.require(:author).permit(:name, :bio)
      end
    end
  end
end
