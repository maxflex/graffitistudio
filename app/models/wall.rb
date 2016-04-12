class Wall < ActiveRecord::Base
  include ActiveModel::Validations::Callbacks
  # require 'open-uri'

  # validate :url_correct
  validates :url, uniqueness: { case_sensitive: false },
      url: {tag: "<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>"}
  validates :url, :desc, :img, presence: true

  before_validation :crop_host

  private

    # # Validate url
    # def url_correct
    #   body = open(url).read
    #   if !body.include? "<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>"
    #     return errors.add :base, I18n.t('errors.no_code')
    #   end
    #
    #   if url.match('(([a-z0-9\-\.]+)?[a-z0-9\-]+(!?\.[a-z]{2,4}))').nil?
    #     return errors.add :base, I18n.t('errors.invalid_url')
    #   end
    #
    # end

    # Crop url host
    def crop_host
      self.url = URI.parse(url).scheme + "://" + URI.parse(url).host
    end
end
