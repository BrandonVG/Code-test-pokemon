class Habilidad < ApplicationRecord
  has_and_belongs_to_many :pokemones
end
