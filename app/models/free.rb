class Free < ActiveRecord::Base
  validate :url_correct
  validates :url, uniqueness: { case_sensitive: false, message: "1" }

  private
    # Validate url
    def url_correct
      if url.blank?
        return errors.add :base, I18n.t('errors.blank_url')
      end

      if url.match('(([a-z0-9\-\.]+)?[a-z0-9\-]+(!?\.[a-z]{2,4}))').nil?
        return errors.add :base, I18n.t('errors.invalid_url')
      end

    end
end
