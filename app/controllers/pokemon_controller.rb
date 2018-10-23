class PokemonController < ApplicationController

  def index
  end

  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)


    name = body["name"]
    id = body["id"]
    types = body["types"][0]["type"]["name"]

    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{name}&rating=g")
    body = JSON.parse(res.body)
    binding.pry

    gif_url = body["data"][0]["url"]

    render json: { "name": name,
                    "id": id,
                    "types": types,
                    "gif": gif_url
                 }





  end

end
