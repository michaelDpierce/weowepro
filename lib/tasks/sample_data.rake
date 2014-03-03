namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    Rake.application['db:reset'].invoke

    100.times do |n|

      WeoweForm.create!(customer_first_name: Faker::Name.first_name,
                        customer_last_name: Faker::Name.last_name,
                        customer_phone_mobile: Faker::PhoneNumber.phone_number,
                        customer_email: Faker::Internet.email,

      )
    end
  end
end
