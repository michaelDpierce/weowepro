require 'spec_helper'

describe WeoweForm do
  before do
    @weowe_form = WeoweForm.new(customer_first_name: 'Michael',
                                customer_last_name: 'Pierce',
                                customer_phone_mobile: '720.387.9691',
                                customer_email: 'matchmike1313@gmail.com',
                                theyowe_info: 'blah',
                                customer_total_value: 300,
                                stock_number: '111',
                                year: '2014',
                                make: 'Ford',
                                vehicle_model: 'Mustang',
                                color: 'Blue',
                                sold_date: '2001-01-01',
                                description_1: 'Blah 1',
                                quantity_1: '1',
                                dealer_total_value_1: '400',
                                dealer_wholesale_1: '300',
                                description_2: 'Blah 2',
                                quantity_2: '2',
                                dealer_total_value_2: '300',
                                dealer_wholesale_2: '200',
                                description_3: 'Blah 3',
                                quantity_3: '3',
                                dealer_total_value_3: '600',
                                dealer_wholesale_3: '200',
                                description_4: 'Blah 4',
                                quantity_4: '4',
                                dealer_total_value_4: '4100',
                                dealer_wholesale_4: '3100',
                                description_5: 'Blah 5',
                                quantity_5: '5',
                                dealer_total_value_5: '2400',
                                dealer_wholesale_5: '2300',
                                custom_date: '1988-07-13',
                                user_id: 1,
                                dealer_id: 1,
                                pending: true,
                                completed: false
                     )
  end

  subject { @weowe_form }

  it { should respond_to(:customer_first_name) }
  it { should respond_to(:customer_last_name) }
  it { should respond_to(:customer_phone_mobile) }
  it { should respond_to(:customer_email) }
  it { should respond_to(:theyowe_info) }
  it { should respond_to(:customer_total_value) }

  it { should respond_to(:stock_number) }
  it { should respond_to(:year) }
  it { should respond_to(:make) }
  it { should respond_to(:vehicle_model) }
  it { should respond_to(:color) }
  it { should respond_to(:sold_date) }

  it { should respond_to(:description_1) }
  it { should respond_to(:quantity_1) }
  it { should respond_to(:dealer_total_value_1) }
  it { should respond_to(:dealer_wholesale_1) }

  it { should respond_to(:description_2) }
  it { should respond_to(:quantity_2) }
  it { should respond_to(:dealer_total_value_2) }
  it { should respond_to(:dealer_wholesale_2) }

  it { should respond_to(:description_3) }
  it { should respond_to(:quantity_3) }
  it { should respond_to(:dealer_total_value_3) }
  it { should respond_to(:dealer_wholesale_3) }

  it { should respond_to(:description_4) }
  it { should respond_to(:quantity_4) }
  it { should respond_to(:dealer_total_value_4) }
  it { should respond_to(:dealer_wholesale_4) }

  it { should respond_to(:description_5) }
  it { should respond_to(:quantity_5) }
  it { should respond_to(:dealer_total_value_5) }
  it { should respond_to(:dealer_wholesale_5) }

  it { should respond_to(:custom_date) }
  it { should respond_to(:user_id) }
  it { should respond_to(:dealer_id) }
  it { should respond_to(:pending) }
  it { should respond_to(:completed) }

  it { should be_valid }

  describe 'when customer_first_name is not present' do
    before { @weowe_form.customer_first_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when customer_last_name is not present' do
    before { @weowe_form.customer_last_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when stock_number is not present' do
    before { @weowe_form.stock_number = ' ' }
    it { should_not be_valid }
  end

  describe 'when year is not present' do
    before { @weowe_form.year = ' ' }
    it { should_not be_valid }
  end

  describe 'when make is not present' do
    before { @weowe_form.make = ' ' }
    it { should_not be_valid }
  end

  describe 'when vehicle_model is not present' do
    before { @weowe_form.vehicle_model = ' ' }
    it { should_not be_valid }
  end

  describe 'when color is not present' do
    before { @weowe_form.color = ' ' }
    it { should_not be_valid }
  end

  describe 'when sold_date is not present' do
    before { @weowe_form.sold_date = ' ' }
    it { should_not be_valid }
  end
end
