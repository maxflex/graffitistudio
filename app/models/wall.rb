class Wall < ActiveRecord::Base
  include ActiveModel::Validations::Callbacks
  # require 'open-uri'

  # validate :url_correct
  validates :url, url: {check_code: true,
    code: "<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>",
    check_one_hungred: true}
  validates :url, :desc, :img, presence: true

  before_validation :crop_host

  private
    def crop_host
      self.url = URI.parse(url).scheme + "://" + URI.parse(url).host
    end
end
