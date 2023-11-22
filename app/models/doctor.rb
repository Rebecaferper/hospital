class Doctor < ApplicationRecord
  has_many :educations, dependent: :destroy
  has_many :appointments
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :experience, inclusion: { in: 2..6 }
  validates :title, inclusion: { in: ['Prof', 'Dr']}
  validates :specialty, inclusion: { in: ['Dermatologist', 'Pneumologist', 'Cardiologist', 'Dentist', 'GP'] }
end
