class PaymentsController < ApplicationController
  require 'digest/sha1'

  skip_before_action :verify_authenticity_token
  layout false

  def yandex
    secret_word = 'rhBZEuwaF3j8VjmV2dMKH9gf'
    # order_data = params[:label].split '|'
    # good = Good.find(order_data[0])
    TestPay.create(field: params[:label])
    # check sum
    # return if params[:amount].to_f.ceil < good.price

    # hash generate
    hash = [
      params[:notification_type],
      params[:operation_id],
      params[:amount],
      params[:currency],
      params[:datetime],
      params[:sender],
      params[:codepro],
      secret_word,
      params[:label]
    ].join('&')

    # check hash
    # puts hash.colorize :yellow
    # puts Digest::SHA1.hexdigest(hash).colorize :red
    # puts params[:sha1_hash].colorize :green
    # return if Digest::SHA1.hexdigest(hash) != params[:sha1_hash]

    if Digest::SHA1.hexdigest(hash) != params[:sha1_hash]
      render text: 'HTTP 400 FAIL'
    end

    order = Promote.find_by(id: params[:label])
    order.pay = true
    order.save
    # order = Order.new(good_id: order_data[0], link: order_data[1], user_id: order_data[2])
    # order.external_order

    render text: 'HTTP 200 OK'

  end
  def test

    respond_to do |format|
        format.json { render json: { res: TestPay.all }, status: :ok}
        # format.json { render json: {errors: request.errors.full_messages }, status: :unprocessable_entity }
    end
  end
end
