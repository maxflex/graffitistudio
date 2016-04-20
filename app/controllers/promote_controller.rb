class PromoteController < ApplicationController
  def add_request
    request = Promote.new(email: params[:email], url: params[:url], desc: params[:desc],
        subject: params[:subject], fio: params[:fio])
    respond_to do |format|
      if request.valid?
        request.save
        format.json { render json: {order: request.id }, status: :ok}
      else
        format.json { render json: {errors: request.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end
end
