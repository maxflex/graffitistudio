class Free < ActiveRecord::Base
  validate :url_correct

  private
    # Validate url
    def url_correct
      if url.blank?
        return errors.add :base, I18n.t('errors.blank_url')
      end

      if url.match('https?://(m.)?vk.com').nil?
        return errors.add :base, I18n.t('errors.should_start_with_vk_com')
      end

    end
end
