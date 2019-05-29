class Reserva < ApplicationRecord
	belongs_to :carro, class_name: "Carro"
	validates :responsavel, presence: true
    validates :carro_id, presence: true, :uniqueness => true
end
