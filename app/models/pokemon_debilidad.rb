class PokemonDebilidad < ApplicationRecord
  belongs_to :pokemon
  belongs_to :tipo
end
