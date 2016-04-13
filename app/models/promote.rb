class Promote < ActiveRecord::Base
  validates :email, :url, :fio, presence: true
  validates :url url: {check_code: false}
end
