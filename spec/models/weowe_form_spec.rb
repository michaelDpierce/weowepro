require 'spec_helper'

describe WeoweForm do
  before do
    @weowe_form = WeoweForm.new(weowe_id: '1',
                                customer_first_name: 'Michael',
                                customer_last_name: 'Pierce',
                                customer_phone_mobile: '720.387.9691',
                                customer_email: 'matchmike1313@gmail.com',
                                custom_date: '1988-07-13',
                                stock_number: '111',
                                year: '2014',
                                make: 'Ford',
                                vehicle_model: 'Mustang',
                                color: 'Blue',
                                sold_date: '2001-01-01',
                                weowe_info: 'blah',
                                theyowe_info: 'blah',
                                customer_signature: 'Michael Pierce',
                                dealer_parts_value: 50,
                                dealer_labor_value: 700,
                                dealer_total_value: 750,
                                customer_total_value: 300,
                                pending: true,
                                completed: false,
                                user_id: 1,
                                dealer_id: 1
                     )
  end

  subject { @weowe_form }

  it { should respond_to(:weowe_id) }
  it { should respond_to(:customer_first_name) }
  it { should respond_to(:customer_last_name) }
  it { should respond_to(:customer_phone_mobile) }
  it { should respond_to(:customer_email) }
  it { should respond_to(:custom_date) }
  it { should respond_to(:stock_number) }
  it { should respond_to(:year) }
  it { should respond_to(:make) }
  it { should respond_to(:vehicle_model) }
  it { should respond_to(:color) }
  it { should respond_to(:sold_date) }
  it { should respond_to(:weowe_info) }
  it { should respond_to(:theyowe_info) }
  it { should respond_to(:customer_signature) }
  it { should respond_to(:dealer_parts_value) }
  it { should respond_to(:dealer_labor_value) }
  it { should respond_to(:dealer_total_value) }
  it { should respond_to(:customer_total_value) }
  it { should respond_to(:pending) }
  it { should respond_to(:completed) }
  it { should respond_to(:user_id) }
  it { should respond_to(:dealer_id) }
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

  describe 'when weowe_info is not present' do
    before { @weowe_form.weowe_info = ' ' }
    it { should_not be_valid }
  end

  describe 'when customer_signature is not present' do
    before { @weowe_form.customer_signature = ' ' }
    it { should_not be_valid }
  end

end


