class FreeController < ApplicationController
  def addUrl
    url = URI.parse(params[:url]).host
    # Вот тут нужно уточнить, если вводим нормальный адрес, например
    # http://example.com или http://example.com/home/params то все нормально, мы
    # получаем хост (example.com) а если не указываем http:// то получаем пустую
    # пеерменную url

    # Free.create(url: url)
    http = Curl.get(url)
    str = http.body_str.html_safe
    # render html: str

    if str.include? "<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>"
      respond_to do |format|
        free = Free.create(url: url)
        if free.errors.messages[:url].nil?
          format.json { render :json => {status: 'true'} }
        else
          format.json { render :json => {status: 'false', error_code: free.errors.messages[:url][0] } }
        end
      end
    else
      render :json => {status: 'false', error_code: '1025'}
    end
  end
end
