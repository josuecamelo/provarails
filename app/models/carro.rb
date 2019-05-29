class Carro < ApplicationRecord
	validates :marca, presence: true
    validates :modelo, presence: true, :uniqueness => true
end