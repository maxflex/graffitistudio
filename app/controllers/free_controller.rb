class FreeController < ApplicationController

  def add_url
    free = Free.create(url_original: params[:url])

    respond_to do |format|
      if free.valid?
        format.json { render json: nil, status: :ok}
      else
        format.json { render json: {errors: free.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end
end
