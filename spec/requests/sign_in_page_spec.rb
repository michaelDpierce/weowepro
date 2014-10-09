require 'spec_helper'

describe 'Sign In Page' do

  before { visit('/users/sign_in') }

  subject { page }

  it { should have_title('WeOwePro | Sign In') }
  it { should have_content('WeOwePro') }
  it { should have_content('Email') }
  it { should have_content('Password') }
end
