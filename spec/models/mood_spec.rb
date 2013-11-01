require 'spec_helper'

describe Mood do

  let(:user) { FactoryGirl.create(:user) }
  before { @mood = user.moods.build(state: 10) }

  subject { @mood }

  it { should respond_to(:state) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:timestamp) }
  its(:user) { should eq user }
end
