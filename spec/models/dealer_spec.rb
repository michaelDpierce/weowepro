require 'spec_helper'

describe Dealer do
  before do
    @dealer = Dealer.new(name: 'Autonation', address_1: '14270 W Warren Dr',
                     address_2: 'Unit B', city: 'Lakewood',
                     state: 'CO', zip: 80228, phone_number: '720.387.9691'
                     )
  end

  subject { @dealer }

  it { should respond_to(:name) }
  it { should respond_to(:address_1) }
  it { should respond_to(:address_2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:phone_number) }
  it { should be_valid }

  describe 'when name is not present' do
    before { @dealer.name = ' ' }
    it { should_not be_valid }
  end

  describe 'address_1 is not present' do
    before { @dealer.address_1 = ' ' }
    it { should_not be_valid }
  end

  describe 'city is not present' do
    before { @dealer.city = ' ' }
    it { should_not be_valid }
  end

  describe 'state is not present' do
    before { @dealer.state = ' ' }
    it { should_not be_valid }
  end

  describe 'zip is not present' do
    before { @dealer.zip = ' ' }
    it { should_not be_valid }
  end

  describe 'phone_number is not present' do
    before { @dealer.phone_number = ' ' }
    it { should_not be_valid }
  end
end
