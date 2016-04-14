class CheckEmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}/
      record.errors[attribute] << (I18n.t('errors.invalid_email'))
    end
  end
end
