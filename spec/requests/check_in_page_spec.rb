require 'spec_helper'
require 'pp'

describe 'Check In Page' do
  let!(:dealer) { FactoryGirl.create(:dealer) }
  let!(:user) { FactoryGirl.create(:user, dealer_id: dealer.id) }

  before do
    login_as(user, scope: :user)
    visit users_path
  end

  subject { page }

  it { should have_title('COMSA Tracker | Swimmer Check In') }
  it { should have_selector('h1', text: 'Swimmer Check In') }
  it { should have_content('Last Name') }
  it { should have_content('First Name') }
end
