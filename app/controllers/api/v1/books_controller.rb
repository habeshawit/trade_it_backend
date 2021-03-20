class Api::V1::BooksController < ApplicationController

    def index
        books = Book.all
        render json: books
    end

    def create
        book = Book.new(book_params)
        if book.save
            render json: book, status: :accepted
        else
            render json: {errors: book.errors.full_message}, status: :unprocessible_entity
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :description, :image_url, :price, :seller_info, :category_id)
    end

end