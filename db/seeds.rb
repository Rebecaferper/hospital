# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
Doctor.destroy_all

puts 'Creating 5 fake doctors...'
5.times do
  doctor = Doctor.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: ['Dr', 'Prof'].sample,
    available: Faker::Boolean.boolean,
    specialty: ['Dermatologist', 'Pneumologist', 'Cardiologist', 'Dentist', 'GP'].sample,
    experience: Faker::Number.between(from: 2, to: 6)
  )
  doctor.save!
end
puts 'Finished!'

Education.destroy_all
puts 'Creating fake education...'
10.times do
education = Education.new(
    university: Faker::University.name,
    degree_name: Faker::Educator.course,
    score: Faker::Number.between(from: 50, to: 100),
    doctor: Doctor.all.sample
  )
education.save!
end
puts 'Finished'

Patient.destroy_all
puts 'All patient destroyed from the database.'
puts 'Creating 5 fake patients...'
5.times do
  patient = Patient.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    insurance: ['Private', 'Public'].sample,
    cured: Faker::Boolean.boolean
  )
  patient.save!
end
puts 'Finished!'

Appointment.destroy_all
5.times do
  appointment = Appointment.new(
    date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    cause: ['Broken Arm', 'Broken Heart', 'Grippe', 'Reflux', 'OCD'].sample,
    urgent: Faker::Boolean.boolean,
    patient: Patient.all.sample,
    doctor: Doctor.all.sample
  )
  appointment.save!
end
puts 'Finished!'
