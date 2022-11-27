# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.create!(
  name: 'まくらパスタ',
  email: 'makura@mail',
  password: ENV['PASSWORD'],
  genre: '洋食',
  zipcode: '1234567',
  address: '神奈川県○○市○○町１－２－３',
  phone_number: '1234567890',
  start_time: '10:00',
  finish_time: '22:00',
  )
