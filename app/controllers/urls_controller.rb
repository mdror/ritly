class UrlsController < ApplicationController

    def index

    end


    def new
      @url = Url.new
    end

    def create
      @url = Url.new(hash_code_params)
      @url.hash_code = rand(1..10000) 
      if @url.save
      redirect_to @url
      else render 'new'
      end

    end

    
    def show
      @url = Url.find params[:id] 
      @full_path = "#{request.host_with_port}/#{@url.hash_code}"
    end

    
  def redirector
    @url = Url.find_by(hash_code: params[:hash_code])
    if @url && !@url.link.blank?
      redirect_to @url.link
    else
      redirect_to root_path
    end
  end


  def preview
    @url = Url.find_by hash_code: params[:hash_code]
    unless @url
      redirect_to root_path
    end
  end

private

def hash_code_params
  params.require('url').permit(:link, :hash_code)
end


end





