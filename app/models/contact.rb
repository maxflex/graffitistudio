class Contact < ActiveRecord::Base
  validates :email, check_email: true
  validates :name, :email, :message, presence: true
end
