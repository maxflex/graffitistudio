class WallController < ApplicationController
  def index
  end

  def add_banner
    wall = Wall.new(url: params[:site_url], desc: params[:site_title], img: params[:banner_url])
    respond_to do |format|
      if wall.valid?
        wall.save
        format.json { render json: nil, status: :ok}
      else
        format.json { render json: {errors: wall.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def get_banners
    respond_to do |format|
      format.json { render json: {banners: Wall.group("url").limit(100).order("RANDOM()")}, status: :ok}
    end
  end
end
