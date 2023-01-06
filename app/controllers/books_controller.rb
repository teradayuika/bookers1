class BooksController < ApplicationController
   
    def new
    @book = Book.new 
    end
  
    def index
        @books = Book.all
    end
    
    def create
        book = Book.new(book_params)
        if @book.save
            flash[:notice] = "sBook was successfully created." 
            redirect_to show_path(book.id)
        else
            render :new
        end  
    end
    
    def show
        @book = Book.find(params[:id])
    end
  
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "Book was successfully updated." 
            redirect_to show_path(book.id)  
        else
            render :new
        end
    end

    def destroy
        book = Book.find(params[:id])  
        book.destroy  
        redirect_to '/books' 
    end
    
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
