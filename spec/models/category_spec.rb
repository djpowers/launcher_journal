require 'spec_helper'

describe Category do

  it { should have_valid(:name).when("Happy", "Story Time") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_many (:entries) }

end
