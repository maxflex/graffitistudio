class UrlValidator < ActiveModel::EachValidator
  require 'open-uri'

  def validate_each(record, attribute, value)
    body = open(value).read
    puts "options", options[:tag]
    if !body.include? options[:tag]
      record.errors[attribute] << (I18n.t('errors.no_code'))
    end

    if value.match('(([a-z0-9\-\.]+)?[a-z0-9\-]+(!?\.[a-z]{2,4}))').nil?
      record.errors[attribute] << (I18n.t('errors.invalid_url'))
    end
  end
end
