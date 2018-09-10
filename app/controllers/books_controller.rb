class BooksController < ApplicationController
    def index
        author = Author.find(params[:author_id])
        
        if author
        
        respond_to do |format|
            format.html{render html: 'Hola Mundo', status:200}
            format.json{render json: books, status:200}
        
        end
    end
    
    def create
        
        author = Author.find(params[:author_id])    
        book = Book.new(params_book)
        if book.save
            respond_to do |format|
                format.json{render json: books, status: 201}
            end
        
        else
            respond_to do |format|
                format.json{render json: books.errors, status: :unprocessable_entity}
                
            end
        end
    end    
    
    def show
        
        author = Author.find(params[:author_id])
        book = Book.find(params[:id])
        respond_to do |format|
            format.json {render json: book, status: 200}
        end    
    end
    
    def destroy
        author = Author.find(params[:author_id])
        book = Book.find(params[:id])
        book.destroy
        respond_to do |format|
            format.json {render json: book, status: 200}
        end
    end
    
    def update
        author = Author.find(params[:author_id])
        book = author.books.find(params[:id])
        if book.update(params_book)
            render json: book, status: 200 
        else
            render json: book.errors, status: 422 
        end
        
    end
    
    def params_book
        params.permit(:name, :year, :code, :available)
    end    
end
