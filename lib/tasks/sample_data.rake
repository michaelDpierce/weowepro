namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do

    2.times do |n|
      Dealer.create!(name: %w(AutoNation Stevinson).sample,
                     address_1: Faker::Address.street_address,
                     address_2: Faker::Address.secondary_address,
                     city: Faker::Address.city,
                     state: Faker::Address.state_abbr,
                     zip: Faker::Address.zip_code,
                     phone_number: Faker::PhoneNumber.phone_number,
                     time_zone:  'Mountain Time (US & Canada)'
                    )
    end

    1000.times do |n|

      WeoweForm.create!(customer_first_name: Faker::Name.first_name,
                        customer_last_name: Faker::Name.last_name,
                        customer_phone_mobile: Faker::PhoneNumber.phone_number,
                        customer_email: Faker::Internet.email,
                        stock_number: (10000..19999).to_a.sample,
                        year: (1980..2014).to_a.sample,
                        make: %w(GMC Ford Dodge BMW Jeep).sample,
                        vehicle_model: %w(Mustang 5i Viper Wrangler).sample,
                        color: %w(Red Black Green Yellow Silver White).sample,
                        sold_date: Time.now - rand(90).day,
                        weowe_info: 'We owe...',
                        dealer_parts_value: rand(1000 .. 10000),
                        dealer_labor_value: rand(1000 .. 10000),
                        dealer_total_value: rand(1000 .. 10000),
                        theyowe_info: 'They owe...',
                        customer_total_value: (500..3000).to_a.sample.round(2),
                        custom_date: Time.now - rand(90).day,
                        customer_signature: 'Michael Pierce',
                        pending: [true, false].sample,
                        completed: false,
                        user_id: (1..200).to_a.sample,
                        dealer_id: 1
                      )
    end

    1000.times do |n|

      WeoweForm.create!(customer_first_name: Faker::Name.first_name,
                        customer_last_name: Faker::Name.last_name,
                        customer_phone_mobile: Faker::PhoneNumber.phone_number,
                        customer_email: Faker::Internet.email,
                        stock_number: (10000..19999).to_a.sample,
                        year: (1980..2014).to_a.sample,
                        make: %w(GMC Ford Dodge BMW Jeep).sample,
                        vehicle_model: %w(Mustang 5i Viper Wrangler).sample,
                        color: %w(Red Black Green Yellow Silver White).sample,
                        sold_date: Time.now - rand(90).day,
                        weowe_info: 'We owe...',
                        dealer_parts_value: rand(1000 .. 10000),
                        dealer_labor_value: rand(1000 .. 10000),
                        dealer_total_value: rand(1000 .. 10000),
                        theyowe_info: 'They owe...',
                        customer_total_value: (500..3000).to_a.sample.round(2),
                        custom_date: Time.now - rand(90).day,
                        customer_signature: 'Michael Pierce',
                        pending: false,
                        completed: [true, false].sample,
                        user_id: (1..200).to_a.sample,
                        dealer_id: 1
                      )
    end

    User.create!(first_name: 'Michael',
                 last_name: 'Pierce',
                 phone_number: '720-387-9691',
                 email: 'example@weowepro.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 dealer_id: 1,
                 department: 'Manager',
                 confirmed_at: DateTime.now
               )

    User.create!(first_name: 'Michael',
                 last_name: 'Pierce',
                 phone_number: '720-387-9691',
                 email: 'example2@weowepro.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 dealer_id: 2,
                 department: 'Manager',
                 confirmed_at: DateTime.now
               )

    200.times do |n|

      User.create!(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   phone_number: Faker::PhoneNumber.phone_number,
                   email: Faker::Internet.email,
                   password: 'foobar22',
                   password_confirmation: 'foobar22',
                   dealer_id: 1,
                   department: %w(Service Sales).sample,
                   confirmed_at: DateTime.now
                  )
    end
  end
end
