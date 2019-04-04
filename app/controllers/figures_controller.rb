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
    FigureTitle.create(title_id: params[:figure][:title_ids][0], figure_id: @figure.id)
    @landmark = Landmark.find(params[:figure][:landmark_ids][0])
    @landmark.figure = @figure.id
    binding.pry
    
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
