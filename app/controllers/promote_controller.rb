class PromoteController < ApplicationController
  def add_request
    request = Promote.new(email: params[:email], url: prarms[:url], desc: params[:desc],
        subject: params[:subject], fio: params[:fio])
    respond_to do |format|
      if request.valid?
        request.save
        format.json { render json: nil, status: :ok}
      else
        format.json { render json: {errors: promote.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end
end
