class AuthorsController < ApplicationController
    def index
        authors = Author.all
        render json:authors, status: 200
    end
    
    def create
    
        author = Author.new(params_author)
        if author.save
            render json:author, status: 201
        else
            render json:author.errors, status: :unprocessable_entity 
        end
    end
    
    def params_author
    
        params.permit(:name, :age, :genre)
    
    end    
    
end
