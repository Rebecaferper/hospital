class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :insurance, inclusion: {in: ['Private', 'Public']}
end
