class UrlValidator < ActiveModel::EachValidator
  require 'open-uri'

  def validate_each(record, attribute, value)
    if options[:check_code]
      body = open(value).read
      if !body.include? options[:code]
        record.errors[attribute] << (I18n.t('errors.no_code'))
      end
    end

    if value.match('(([a-z0-9\-\.]+)?[a-z0-9\-]+(!?\.[a-z]{2,4}))').nil?
      record.errors[attribute] << (I18n.t('errors.invalid_url'))
    end

    if options[:check_one_hungred]
      wall = Wall.find_by_sql ["SELECT url FROM (SELECT url FROM walls ORDER BY id DESC LIMIT 100) AS t WHERE t.url = ?",  value]
      if !wall.empty?
        record.errors[attribute] << (I18n.t('errors.url_exist'))
      end
    end
  end
end
