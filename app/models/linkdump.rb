class Linkdump < ActiveRecord::Base
  validates :url, url: true
end
