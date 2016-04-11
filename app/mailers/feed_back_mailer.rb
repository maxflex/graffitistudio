class FeedBackMailer < ApplicationMailer
  def th_for_message(contact)
    @contact = contact
    mail(to: @contact.email,
         subject: 'Welcome to My Awesome Site') do |format|
      format.html { render 'th_for_message' }
    end
  end
end
