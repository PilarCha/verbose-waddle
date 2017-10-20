class Lender < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name,:money, presence: true
  validates :money, :numericality => { :greater_than_or_equal_to => 0 }
  has_many :histories
  has_many :borrowers, through: :histories
  has_secure_password
end
