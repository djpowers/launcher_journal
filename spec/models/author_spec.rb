require 'spec_helper'

describe Author do

  it { should have_valid(:name).when("Dave Powers", "James") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:email).when("dave@test.com", "dave_powers@test.co.uk") }
  it { should_not have_valid(:email).when("dave@", "dave123@gmail") }

end