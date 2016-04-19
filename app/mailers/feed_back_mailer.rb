class FeedBackMailer < ApplicationMailer
  def th_for_message(contact)
    @contact = contact
    mail(to: 'alkul93@yandex.ru',
         subject: 'Новый отзыв!') do |format|
      format.html { render 'th_for_message' }
    end
    mail(to: 'alkul93123@gmail.com',
         subject: 'Новый отзыв!') do |format|
      format.html { render 'th_for_message' }
    end
  end
end
