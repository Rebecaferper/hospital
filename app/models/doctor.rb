class Doctor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :experience, inclusion: { in: 2..6 }
  validates :title, inclusion: { in: ['Prof', 'Dr']}
  validates :specialty, inclusion: { in: ['Dermatologist', 'Pneumologist', 'Cardiolgist', 'Dentist', 'GP'] }
end
