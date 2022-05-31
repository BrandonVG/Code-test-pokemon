class PokemonesController < ApplicationController
  def index
    @pokemones = Pokemon.page params[:page]
    if params[:search_by_name] && params[:search_by_name] != ''
      @pokemones = Pokemon.where('nombre like ?', "%#{params[:search_by_name]}%").page params[:page]
    end
  end

  def no_data
    obtener_datos
    redirect_to root_path
  end

  def detalles
    @pokemon = Pokemon.find(params[:id])
  end

  private

  def obtener_datos
    url = 'https://www.pokemon.com/el/api/pokedex/'
    response = RestClient.get(url)
    body = response.body.force_encoding('UTF-8')
    data = JSON.parse(body)
    SaveData.guardar_habilidades(data) if Habilidad.count.zero?
    SaveData.guardar_tipos(data) if Tipo.count.zero?
    SaveData.guardar_pokemones(data) if Pokemon.count.zero?
  end
end
