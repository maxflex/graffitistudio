class Promote < ActiveRecord::Base
  validates :email, :url, :fio, presence: true
  validates :url, url: {check_code: false}
  validates :email, check_email: true
end
