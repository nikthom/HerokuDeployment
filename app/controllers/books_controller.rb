class BooksController < ApplicationController
    
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
        @genres = genres
    end

    def create
        @book = Book.new(bookParams)
        if @book.save
            flash[:notice] = "Book added successfully"
            redirect_to(root_path)
        else
            render('create')
        end
    end

    def edit
        @book = Book.find(params[:id]) 
        @genres = genres
    end

    def update
        @book = Book.find(params[:id])
        if @book.update_attributes(bookParams)
            flash[:notice] = "Book updated successfully"
            redirect_to(root_path)
        else
            render('edit')
        end
    end

    def delete
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "#{@book.title} deleted successfully"
        redirect_to(root_path)
    end

    def bookParams
        params.require(:book).permit(:title, :author, :genre, :price, :published)
    end

    def genres
        ["Fantasy", "Romance", "History", "Self-help"]
    end
end