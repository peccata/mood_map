require 'spec_helper'

describe User do

  before do
    @user = User.new(nickname: "example", email: "user@example.com", password: "foobar2000")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:nickname) }

  it { should be_valid }

  describe "moods associations" do

    before { @user.save }
    let!(:older_mood) do
      FactoryGirl.create(:mood, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_mood) do
      FactoryGirl.create(:mood, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right moods in the right order" do
      expect(@user.moods.to_a).to eq [newer_mood, older_mood]
    end

    it "should destroy associated moods" do
      moods = @user.moods.to_a
      @user.destroy
      expect(moods).not_to be_empty
      moods.each do |mood|
        expect(Mood.where(id: mood.id)).to be_empty
      end
    end
  end
end