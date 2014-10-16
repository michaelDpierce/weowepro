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

    Dealer.create!(name: "Christopher's Dodge World",
                   address_1: '16777 W Colfax Ave',
                   address_2:'',
                   city: 'Golden',
                   state: 'CO',
                   zip: '80401',
                   phone_number: '303-590-7100',
                   time_zone:  'Mountain Time (US & Canada)'
                  )

    User.create!(first_name: 'Kurt',
                 last_name: 'Price',
                 phone_number: '303-590-7036',
                 email: 'kp@cdodge.com',
                 password: 'cdodge14',
                 password_confirmation: 'cdodge14',
                 dealer_id: 3,
                 department: 'Manager',
                 admin: true,
                 confirmed_at: DateTime.now
               )

100.times do |n|

  WeoweForm.create!(customer_first_name: Faker::Name.first_name,
                    customer_last_name: Faker::Name.last_name,
                    customer_phone_mobile: Faker::PhoneNumber.phone_number,
                    customer_email: Faker::Internet.email,
                    stock_number: (10000..19999).to_a.sample,
                    year: (1980..2014).to_a.sample,
                    make: %w(GMC Ford Dodge BMW Jeep).sample,
                    vehicle_model: %w(Mustang 5i Viper Wrangler).sample,
                    sold_date: Time.now - rand(90).day,
                    quantity_1: 1,
                    quantity_2: 2,
                    quantity_3: 3,
                    quantity_4: 4,
                    quantity_5: 5,
                    dealer_total_value_1: rand(100 .. 1000),
                    dealer_total_value_2: rand(100 .. 1000),
                    dealer_total_value_3: rand(100 .. 1000),
                    dealer_total_value_4: rand(100 .. 1000),
                    dealer_total_value_5: rand(100 .. 1000),
                    dealer_total_value: rand(1000 .. 10000),
                    dealer_wholesale_1: rand(50 .. 500),
                    dealer_wholesale_2: rand(50 .. 500),
                    dealer_wholesale_3: rand(50 .. 500),
                    dealer_wholesale_4: rand(50 .. 500),
                    dealer_wholesale_5: rand(50 .. 500),
                    dealer_wholesale: rand(1000 .. 10000),
                    dealer_actual_1: rand(25 .. 400),
                    dealer_actual_2: rand(25 .. 400),
                    dealer_actual_3: rand(25 .. 400),
                    dealer_actual_4: rand(25 .. 400),
                    dealer_actual_5: rand(25 .. 400),
                    dealer_total_actual: rand(5000 .. 9000),
                    description_1: %w(A B C D E F G H I J K L M N O).sample,
                    description_2: %w(A B C D E F G H I J K L M N O).sample,
                    description_3: %w(A B C D E F G H I J K L M N O).sample,
                    description_4: %w(A B C D E F G H I J K L M N O).sample,
                    description_5: %w(A B C D E F G H I J K L M N O).sample,
                    theyowe_info: 'They owe...',
                    customer_total_value: (500..3000).to_a.sample.round(2),
                    custom_date: Time.now - rand(90).day,
                    pending: [true, false].sample,
                    completed: false,
                    user_id: (1..200).to_a.sample,
                    assigned_sales_person_id: (1..200).to_a.sample,
                    dealer_id: 1
                  )
end

100.times do |n|

  WeoweForm.create!(customer_first_name: Faker::Name.first_name,
                    customer_last_name: Faker::Name.last_name,
                    customer_phone_mobile: Faker::PhoneNumber.phone_number,
                    customer_email: Faker::Internet.email,
                    stock_number: (10000..19999).to_a.sample,
                    year: (1980..2014).to_a.sample,
                    make: %w(GMC Ford Dodge BMW Jeep).sample,
                    vehicle_model: %w(Mustang 5i Viper Wrangler).sample,
                    sold_date: Time.now - rand(90).day,
                    quantity_1: 1,
                    quantity_2: 2,
                    quantity_3: 3,
                    quantity_4: 4,
                    quantity_5: 5,
                    dealer_total_value_1: rand(100 .. 1000),
                    dealer_total_value_2: rand(100 .. 1000),
                    dealer_total_value_3: rand(100 .. 1000),
                    dealer_total_value_4: rand(100 .. 1000),
                    dealer_total_value_5: rand(100 .. 1000),
                    dealer_total_value: rand(1000 .. 10000),
                    dealer_wholesale_1: rand(50 .. 500),
                    dealer_wholesale_2: rand(50 .. 500),
                    dealer_wholesale_3: rand(50 .. 500),
                    dealer_wholesale_4: rand(50 .. 500),
                    dealer_wholesale_5: rand(50 .. 500),
                    dealer_wholesale: rand(1000 .. 10000),
                    dealer_actual_1: rand(25 .. 400),
                    dealer_actual_2: rand(25 .. 400),
                    dealer_actual_3: rand(25 .. 400),
                    dealer_actual_4: rand(25 .. 400),
                    dealer_actual_5: rand(25 .. 400),
                    dealer_total_actual: rand(5000 .. 9000),
                    description_1: %w(A B C D E F G H I J K L M N O).sample,
                    description_2: %w(A B C D E F G H I J K L M N O).sample,
                    description_3: %w(A B C D E F G H I J K L M N O).sample,
                    description_4: %w(A B C D E F G H I J K L M N O).sample,
                    description_5: %w(A B C D E F G H I J K L M N O).sample,
                    theyowe_info: 'They owe...',
                    customer_total_value: (500..3000).to_a.sample.round(2),
                    custom_date: Time.now - rand(90).day,
                    pending: false,
                    completed: [true, false].sample,
                    user_id: (1..50).to_a.sample,
                    assigned_sales_person_id: (1..200).to_a.sample,
                    dealer_id: 1
                  )
end

    # Main admin user for popualte data

    User.create!(first_name: 'Michael',
                 last_name: 'Pierce',
                 phone_number: '720-387-9691',
                 email: 'example@weowepro.com',
                 encrypted_password: 'foobar22',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 dealer_id: 1,
                 department: 'Manager',
                 admin: true,
                 confirmed_at: DateTime.now
               )

    # Dealership #2 usernames

    #Manager
    User.create!(first_name: 'Michael',
                 last_name: 'Pierce',
                 phone_number: '720-387-9691',
                 email: 'mpierce@dealership.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 dealer_id: 2,
                 department: 'Manager',
                 admin: true,
                 confirmed_at: DateTime.now
               )

    User.create!(first_name: 'Ryan',
                 last_name: 'Lacy',
                 phone_number: '720-387-9691',
                 email: 'rlacy@dealership.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 dealer_id: 1,
                 department: 'Sales',
                 admin: false,
                 confirmed_at: DateTime.now
               )

    User.create!(first_name: 'Kris',
                 last_name: 'Turner',
                 phone_number: '720-387-9691',
                 email: 'kturner@dealership.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 dealer_id: 2,
                 department: 'Service',
                 admin: true,
                 confirmed_at: DateTime.now
               )

    User.create!(first_name: 'Johnny',
                 last_name: 'Lamb',
                 phone_number: '720-387-9691',
                 email: 'jlamb@dealership.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 dealer_id: 2,
                 department: 'F&I',
                 admin: true,
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
