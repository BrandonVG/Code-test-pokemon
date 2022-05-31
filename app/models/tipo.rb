class Tipo < ApplicationRecord
  has_and_belongs_to_many :pokemones
  has_many :pokemon_debilidads
end
