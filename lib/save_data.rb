class SaveData
  class << self
    def guardar_habilidades(data)
      habilidades_array = []
      data.each do |poke|
        poke['abilities'].each do |habilidad|
          habilidades_array << { habilidad: habilidad }
        end
      end
      Habilidad.insert_all(habilidades_array)
    end

    def guardar_tipos(data)
      tipos_array = []
      data.each do |poke|
        poke['type'].each do |tipo|
          tipo_es = traducir_nombre(tipo)
          tipos_array << { tipo: tipo_es }
        end
      end
      Tipo.insert_all(tipos_array)
    end

    def guardar_relaciones_pokemones(data)
      debilidades_array = []
      tipos_array = []
      habilidades_array = []
      data.each do |poke|
        pokemon = Pokemon.find_by(nombre: poke['name'])
        poke['type'].each do |tipo|
          tipo_es = traducir_nombre(tipo)
          poke_tipo = Tipo.find_by(tipo: tipo_es)
          count = 0
          cond = true
          tipos_array.each do |ar|
            if ar[:pokemon_id] == pokemon.id
              count += 1
            end
            if ar[:pokemon_id] == pokemon.id && poke_tipo.id == ar[:tipo_id]
              cond = false
            end
          end
          tipos_array << { pokemon_id: pokemon.id, tipo_id: poke_tipo.id } if count < 2 && cond
        end
        poke['abilities'].each do |h|
          cond = true
          habilidad = Habilidad.find_by(habilidad: h)
          habilidades_array.each do |i|
            if i[:pokemon_id] == pokemon.id && i[:habilidad_id] == habilidad.id
              cond = false
            end
          end
          habilidades_array << { pokemon_id: pokemon.id, habilidad_id: habilidad.id } if cond
        end
        poke['weakness'].each do |w|
          cond = true
          debilidad = Tipo.find_by(tipo: w)
          debilidades_array.each do |i|
            if i[:pokemon_id] == pokemon.id && i[:tipo_id] == debilidad.id
              cond = false
            end
          end
          debilidades_array << { pokemon_id: pokemon.id, tipo_id: debilidad.id } if cond
        end
      end
      PokemonesTipo.insert_all(tipos_array)
      HabilidadesPokemon.insert_all(habilidades_array)
      PokemonDebilidad.insert_all(debilidades_array)
    end

    def guardar_pokemones(data)
      pokemones_array = []
      data.each do |poke|
        pokemon = Pokemon.new(peso: poke['weight'], nombre: poke['name'], numero: poke['number'], altura: poke['height'], imagen: poke['ThumbnailImage'])
        json = JSON.parse(pokemon.to_json)
        pokemones_array << json.except!(:id)
      end
      Pokemon.insert_all(pokemones_array)
      guardar_relaciones_pokemones(data)
    end


    def traducir_nombre(nombre)
      case nombre
      when 'normal'
        'Normal'
      when 'fire'
        'Fuego'
      when 'water'
        'Agua'
      when 'grass'
        'Planta'
      when 'electric'
        'Eléctrico'
      when 'ice'
        'Hielo'
      when 'fighting'
        'Lucha'
      when 'poison'
        'Veneno'
      when 'ground'
        'Tierra'
      when 'flying'
        'Volador'
      when 'psychic'
        'Psíquico'
      when 'bug'
        'Bicho'
      when 'rock'
        'Roca'
      when 'ghost'
        'Fantasma'
      when 'dark'
        'Siniestro'
      when 'dragon'
        'Dragón'
      when 'steel'
        'Acero'
      when 'fairy'
        'Hada'
      end
    end
  end
end
