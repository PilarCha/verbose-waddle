class Borrower < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name,:last_name,:purpose, :description, :money, presence: true
  has_many :histories
  has_many :lendors, through: :histories
  has_secure_password
end
