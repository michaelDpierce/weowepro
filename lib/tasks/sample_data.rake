namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do

    100.times do |n|

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
                        weowe_info: Faker::Lorem.characters(char_count = 255),
                        dealer_parts_value: (500..3000).to_a.sample,
                        dealer_labor_value: (500..3000).to_a.sample,
                        dealer_total_value: (500..3000).to_a.sample,
                        theyowe_info: Faker::Lorem.characters(char_count = 255),
                        customer_total_value: (500..3000).to_a.sample,
                        custom_date: Time.now - rand(90).day
      )
    end
  end
end
