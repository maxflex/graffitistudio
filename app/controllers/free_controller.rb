class FreeController < ApplicationController
  def addUrl
    url = URI.parse(params[:url]).host

    respond_to do |format|
      if Free.create(url: url)
        format.json { render :json => {status: 'true'} }
      else
        format.json { render :json => {status: 'false'} }
      end
    end
  end

end
