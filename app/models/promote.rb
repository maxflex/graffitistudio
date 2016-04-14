class Promote < ActiveRecord::Base
  validates :email, :url, :fio, presence: true
  validates :url, url: true
  validates :email, check_email: true
end
