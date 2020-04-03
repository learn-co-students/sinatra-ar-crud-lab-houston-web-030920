
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :'new'
  end

  post '/articles' do
    @article = Article.create({
      title: params[:title],
      content: params[:content]
    })
    redirect :'/show'
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :'/show'
  end

  get '/articles' do
    @article = Article.all 
    erb :'index'

  end

  get '/articles/:id/edit' do 
    @article = Article.find_by(id: params[:id])
    erb :'edit'
  end

  patch '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    @article.update({
      title: params[:title],
      content: params[:content]
    })
    redirect :"/articles/#{@article.id}"
  end

  delete '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    @article.delete
    redirect ('/articles')
  end
end























