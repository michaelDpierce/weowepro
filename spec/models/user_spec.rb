require 'spec_helper'

describe User do
  before do
    @user = User.new(first_name: 'First',
                     last_name: 'Last',
                     email: 'user@example.com',
                     phone_number: '720.387.9691',
                     password: 'foobar77',
                     password_confirmation: 'foobar77',
                     admin: true,
                     active: true,
                     department: 'Sales',
                     dealer_id: 1
                     )
  end

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:admin) }
  it { should respond_to(:active) }
  it { should respond_to(:department) }
  it { should respond_to(:dealer_id) }

  describe 'when password is too short' do
    before { @user.password = 'foo' }
    it { should_not be_valid }
  end

  describe 'when first name is not present' do
    before { @user.first_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when last name is not present' do
    before { @user.last_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe 'when phone number is not present' do
    before { @user.phone_number = ' ' }
    it { should_not be_valid }
  end

  describe 'when first name is too long' do
    before { @user.first_name = 'a' * 16 }
    it { should_not be_valid }
  end

  describe 'when last name is too long' do
    before { @user.last_name = 'a' * 26 }
    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before { @user.password = @user.password_confirmation = ' ' }
    it { should_not be_valid }
  end

  describe 'when password doesn\'t match confirmation' do
    before do
      @user.password = 'hellomynameis'
      @user.password_confirmation = 'mismatch'
    end
    it { should_not be_valid }
  end

  describe 'with a password that\'s too short' do
    before { @user.password = @user.password_confirmation = 'a' * 5 }
    it { should_not be_valid }
  end

  describe 'when dealer id is not present' do
    before { @user.dealer_id = ' ' }
    it { should_not be_valid }
  end
end
