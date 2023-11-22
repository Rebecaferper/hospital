class Education < ApplicationRecord
  validates :university, presence: true
  validates :degree_name, presence: true
  validates :score, inclusion: { in: 50..100 }
  belongs_to :doctor
end
