FactoryGirl.define do

  factory :dealer do
    name                  'Autonation'
    address_1             '1111 E Warren Ave'
    address_2             'Block B'
    city                  'Lakewood'
    state                 'CO'
    zip                   '80228'
    phone_number          '720-387-9691'
  end

  factory :weowe_form do
    customer_first_name   'Michael'
    customer_last_name    'Pierce'
    customer_phone_mobile '720.387.9691'
    customer_email        'matchmike1313@gmail.com'
    custom_date           '1988-07-13'
    stock_number          '111'
    year                  '2014'
    make                  'Ford'
    vehicle_model         'Mustang'
    color                 'Blue'
    sold_date             '2001-01-01'
    weowe_info            'blah'
    theyowe_info          'blah'
    customer_signature    'Michael Pierce'
    dealer_parts_value    5000
    dealer_labor_value    7000
    dealer_total_value    12000
    customer_total_value  3000
    pending               true
    completed             false
    user_id               1
    dealer_id             1
  end

  factory :user do
    first_name            'Josh'
    last_name             'Duffy'
    email                 'newuser@example.com'
    password              'foobar77'
    password_confirmation 'foobar77'
    admin                 false
    phone_number          '720-387-9691'
    dealer_id             1
  end

  factory :admin, class: User do
    first_name            'Michael'
    last_name             'Pierce'
    email                 'newuser2@example.com'
    password              'foobar22'
    password_confirmation 'foobar22'
    admin                 true
    phone_number          '720-387-9655'
    dealer_id             1
  end

end
