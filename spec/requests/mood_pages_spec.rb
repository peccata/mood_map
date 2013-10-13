require 'spec_helper'

describe "MoodPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "when saving mood" do
    before { visit root_path }

    describe "with valid information" do

      before { select '7', :from => 'mood_state' }

      it "should save mood" do
        expect { click_button "Save" }.to change(Mood, :count).by(1)
      end
    end

    describe "with invalid information" do
    end
  end

end

