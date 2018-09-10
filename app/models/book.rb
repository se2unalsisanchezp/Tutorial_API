class Book < ApplicationRecord
    
    #Relaciones modelos
    belongs_to :author
    #Validaciones del modelo
    
    
    validates :name, presence: true, length: {minimum: 10}
    
end
