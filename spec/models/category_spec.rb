require 'spec_helper'

describe Category do

  it { should have_valid(:name).when("Happy", "Story Time") }

  it { should validate_uniqueness_of(:name) }

  it { should have_many (:entries) }

end
