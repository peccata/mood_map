require 'spec_helper'

describe "MoodPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:another) { FactoryGirl.create(:user) }
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

  describe "mood destruction" do
    before { FactoryGirl.create(:mood, user: user) }

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a mood" do
        expect { click_link "delete" }.to change(Mood, :count).by(-1)
      end
    end

    describe "as incorrect user" do
      before do
        FactoryGirl.create(:mood, user: another)
        visit user_path(another)
      end

      it { should_not have_link('delete') }
    end
  end

end

