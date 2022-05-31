class Pokemon < ApplicationRecord
  has_and_belongs_to_many :tipos
  has_and_belongs_to_many :habilidades
  has_many :pokemon_debilidads
  has_many :debilidades, through: :pokemon_debilidads, source: :tipo
  paginates_per 12
end
