class FaqController < ApplicationController
  def index
    @questions = Faq.where(visible: true)
  end
end
