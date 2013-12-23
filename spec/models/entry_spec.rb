require 'spec_helper'

describe Entry do

  it { should have_valid(:title).when("My Terrible Day at Launch Academy", "Best Day Ever!!!") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:description).when("We learned a lot of new things today.") }
  it { should_not have_valid(:description).when(nil, "") }


end
