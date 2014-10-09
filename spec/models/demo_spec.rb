require 'spec_helper'

describe Demo do
  before do
    @demo = Demo.new(first_name: 'First',
                     last_name: 'Last',
                     phone_number: '720-387-9691',
                     email: 'matchmike1313@gmail.com',
                     dealership: 'My Dealership'
                     )
  end

  subject { @demo }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:email) }
  it { should respond_to(:dealership) }
end
