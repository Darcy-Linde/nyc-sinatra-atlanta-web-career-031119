class FiguresController < ApplicationController
  set :views, 'app/views/figures'

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    @figures = Figure.all
    erb :new
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    @title = Title.create(name: params["title"]["name"])

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    erb :show
  end

  get '/figures/:id/edit' do
    erb :edit
  end

  patch '/figures/:id' do

  end
end
