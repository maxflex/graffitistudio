require 'test_helper'

class FreeControllerTest < ActionController::TestCase
  require 'open-uri'

  test "it opens a url" do
    body = open('http://vliker.ru').read
  end
  # test "the truth" do
  #   assert true
  # end
end
