class ApplicationController < Sinatra::Base

  set :default_content_type, "application/json"

  get "/games" do
    games = Game.all
    games.to_json
  end

  get "/games/:id" do
    game = Game.find(params[:id])
    game.to_json(only: [:id, :title, :genre, :price], include: {
      reviews: { only: [:comment, :score], include: {
        user: { only: [:name] }
      }}
    })
  end

end
