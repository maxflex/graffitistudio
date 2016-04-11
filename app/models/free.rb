class Free < ActiveRecord::Base
  require 'open-uri'

  validate :url_correct
  validates :url, uniqueness: { case_sensitive: false }
  before_validation :crop_host

  private

    # Crop url host
    def crop_host
      self.url = URI.parse(url_original).host
    end

    # Validate url
    def url_correct
      if url.blank?
        return errors.add :base, I18n.t('errors.blank_url')
      end

      if url.match('(([a-z0-9\-\.]+)?[a-z0-9\-]+(!?\.[a-z]{2,4}))').nil?
        return errors.add :base, I18n.t('errors.invalid_url')
      end

      # body = open(url_original).read
      # if !body.include? "<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>"
      #   return errors.add :base, I18n.t('errors.no_code')
      # end
    end
end
