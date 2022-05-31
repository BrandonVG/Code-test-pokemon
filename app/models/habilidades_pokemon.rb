class HabilidadesPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :habilidad
end
